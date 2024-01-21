package com.modern.office.forms.controllers;

import com.modern.office.config.ClientMappings;
import com.modern.office.forms.domain.Company;
import com.modern.office.forms.domain.FormData;
import com.modern.office.forms.domain.ReleaseInfoReport;
import com.modern.office.forms.services.ReportGeneratorService;
import com.modern.office.forms.services.SignRequestService;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.collections.api.tuple.Pair;
import org.eclipse.collections.impl.factory.Maps;
import org.eclipse.collections.impl.tuple.Tuples;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.Objects;

@RestController
@RequestMapping("/forms")
@RequiredArgsConstructor
@Slf4j
public class FormGenerator {
    private final ReportGeneratorService reportGeneratorService;
    private final SignRequestService signRequestService;
    private final ClientMappings clientMappings;

    @Value("${office-forms.document-local-folder}")
    private String documentLocalFolder;

    @PostMapping(path="/register")
    public List<Pair<String, String>> registerOfficeFormsClient(HttpServletRequest request){
        var publisher = this.getRequestorAddress(request);
        if (Objects.nonNull(publisher))
        {
            log.info("Registering Office Forms client at {}", publisher);
            if (!this.clientMappings.getMappings().containsKey(publisher)){
                this.clientMappings.getMappings().put(publisher, null);
            }
        }
        return this.clientMappings.getMappings().entrySet()
                .stream()
                .map(entry -> Tuples.pair(entry.getKey(), entry.getValue()))
                .toList();
    }

    @PostMapping(path={"/link/{publisher-ip}", "/link"})
    public boolean registerOfficeFormsSignerClient(HttpServletRequest request,
                                                   @PathVariable(value = "publisher-ip", required = false) final String publisherIp){
        var subscriber = this.getRequestorAddress(request);
        if (Objects.isNull(subscriber)) {
            return false;
        }

        log.info("Linking up subscriber {}", subscriber);

        var publisher =  Objects.isNull(publisherIp)
                ? Maps.adapt(this.clientMappings.getMappings()).detectOptional((k, v) -> Objects.isNull(v))
                  .map(Pair::getOne).orElse(null)
                : Maps.adapt(this.clientMappings.getMappings()).detectOptional((k, v) -> publisherIp.equals(k))
                  .map(Pair::getOne).orElse(null);

        log.info("Linking up subscriber {} to publisher {}", subscriber, publisher);

        if (publisher != null){
            this.clientMappings.getMappings().put(publisher, subscriber);
            return true;
        }

        return false;
    }

    @GetMapping(value = "/mappings", produces = MediaType.APPLICATION_JSON_VALUE)
    public List<Pair<String, String>> getMappings(){
        return this.clientMappings.getMappings().entrySet()
                .stream()
                .map(entry -> Tuples.pair(entry.getKey(), entry.getValue()))
                .toList();
    }

    @PostMapping("/release-report/generate")
    public byte[] generateReleaseLegacyReport(@RequestBody ReleaseInfoReport releaseInfoReport) {
        return this.reportGeneratorService.generateReleaseInfoReportLegacy(releaseInfoReport);
    }
    @RequestMapping(value = "/{file-name}", method = RequestMethod.GET, produces = "application/pdf")
    public ResponseEntity<InputStreamResource> downloadPDFFile(@PathVariable("file-name") final String fileName)
            throws IOException {

        File file = new File(this.documentLocalFolder + fileName);

        return ResponseEntity
                .ok()
                .contentLength(file.length())
                .contentType(
                        MediaType.parseMediaType("application/octet-stream"))
                .body(new InputStreamResource(new FileInputStream(file)));
    }

    @PostMapping("/sign-requests")
    public String postRequest(@RequestBody final Map<String, String> requestData, final HttpServletRequest request)
    {
        var subscriber = this.clientMappings.getMappings().get(this.getRequestorAddress(request));
        if (Objects.nonNull(subscriber))
        {
            requestData.put("subscriber", subscriber);
            this.signRequestService.put(requestData);
            return "ok";
        }
        return "no subscriber";
    }

    @PostMapping("/subscriber/{state}")
    public String setSubscriberState(
            final HttpServletRequest request,
            @PathVariable("state") final Boolean state)
    {
        this.signRequestService.setSubscriberState(request.getRemoteAddr(), state);
        return "ok";
    }

    @GetMapping("/subscribers")
    public List<Pair<String, Boolean>> getSubscriberState()
    {
        return this.signRequestService.getSubscriberState();
    }

    @GetMapping("/sign-requests")
    public Map<String, String> getRequest(final HttpServletRequest request)
    {
        return this.signRequestService.getBySubscriber(this.getRequestorAddress(request));
    }

    @GetMapping("/sign-requests/view")
    public List<Map<String, String>> getRequests()
    {
        return this.signRequestService.list();
    }

    @PostMapping(value = "/generate", produces = MediaType.TEXT_PLAIN_VALUE, consumes = "application/json")
    public String generateEyeGlassesForm(@RequestBody final FormData formData) throws IOException {
        log.info("Generating form {}", formData);
        return this.reportGeneratorService.generateForm(formData);
    }

    @CrossOrigin(origins = "*")
    @GetMapping(value = "/company")
    public Company getCompany() {
        return this.reportGeneratorService.getCompany();
    }

    private ResponseEntity<String> getResponse(final FormData formData) {
        try {
            var fileName = this.reportGeneratorService.generateForm(formData);
            return ResponseEntity.ok().body(fileName);

        } catch (Exception e) {
            log.error("Failed generating form", e);
            return ResponseEntity.internalServerError().build();
        }
    }

    private String getRequestorAddress(final HttpServletRequest request)
    {
        return request.getRemoteAddr();
    }
}
