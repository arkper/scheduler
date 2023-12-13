package com.modern.office.forms.controllers;

import com.modern.office.forms.domain.Company;
import com.modern.office.forms.domain.FormData;
import com.modern.office.forms.services.ReportGeneratorService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

@RestController
@RequestMapping("/forms")
@RequiredArgsConstructor
@Slf4j
public class FormGenerator {
    private final ReportGeneratorService reportGeneratorService;
    @Value("${office-forms.document-local-folder}")
    private String documentLocalFolder;

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

    @PostMapping(value = "/generate", produces = MediaType.TEXT_PLAIN_VALUE, consumes = "application/json")
    public String generateEyeGlassesForm(@RequestBody FormData formData) throws IOException {
        return this.reportGeneratorService.generateForm(formData);
    }

    @GetMapping(value = "/company")
    public Company getCompany() {
        return this.reportGeneratorService.getCompany();
    }

    private ResponseEntity<String> getResponse(FormData formData) {
        try {
            var fileName = this.reportGeneratorService.generateForm(formData);
            return ResponseEntity.ok().body(fileName);

        } catch (Exception e) {
            log.error("Failed generating form", e);
            return ResponseEntity.internalServerError().build();
        }
    }
}
