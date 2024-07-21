package com.modern.office.forms.services;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.modern.office.domain.Address;
import com.modern.office.domain.Document;
import com.modern.office.domain.HippaDocument;
import com.modern.office.forms.domain.*;
import com.modern.office.repository.DocumentRepository;
import com.modern.office.repository.HippaDocumentRepository;
import com.modern.office.scheduler.controllers.SchedulerApiController;
import com.modern.office.scheduler.services.SchedulerApiService;
import lombok.extern.slf4j.Slf4j;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JsonDataSource;
import net.sf.jasperreports.engine.util.JRLoader;
import org.eclipse.collections.api.factory.Maps;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.util.Pair;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
@Slf4j
public class ReportGeneratorService {
    private static final Map<Class<?>, Pair<DocType, JasperReport>> FORMS_INFO = new HashMap<>();
    private static final Map<DocType, JasperReport> FORMS_MAP = new HashMap<>();
    private final DocumentRepository documentRepository;
    private final HippaDocumentRepository hippaDocumentRepository;
    @Value("${office-forms.company}")
    private String company;
    @Value("${office-forms.company-address}")
    private String companyAddress;
    @Value("${office-forms.company-city}")
    private String companyCity;
    @Value("${office-forms.company-state}")
    private String companyState;
    @Value("${office-forms.company-zip}")
    private String companyZip;
    @Value("${office-forms.company-phone}")
    private String companyPhone;

    @Value("${office-forms.commission-rate:15}")
    private float commissionRate;

    @Value("${office-forms.document-folder}")
    private String documentFolder;
    @Value("${office-forms.document-local-folder}")
    private String documentLocalFolder;

    private final SchedulerApiService schedulerApiService;

    public ReportGeneratorService(final DocumentRepository documentRepository,
                                  final HippaDocumentRepository hippaDocumentRepository, SchedulerApiService schedulerApiService) throws IOException {
        this.documentRepository = documentRepository;
        this.hippaDocumentRepository = hippaDocumentRepository;
        this.schedulerApiService = schedulerApiService;

        FORMS_MAP.put(DocType.Consent, compileReport(DocType.Consent.getTemplate()));
        FORMS_MAP.put(DocType.ReleaseOfMedicalInfo, compileReport(DocType.ReleaseOfMedicalInfo.getTemplate()));
        FORMS_MAP.put(DocType.MedicaidEyeglasses, compileReport(DocType.MedicaidEyeglasses.getTemplate()));
        FORMS_MAP.put(DocType.TransportationApproval, compileReport(DocType.TransportationApproval.getTemplate()));
        FORMS_MAP.put(DocType.Commissions, compileReport(DocType.Commissions.getTemplate()));

        compileReport("/reports/release-legacy.jrxml");
    }

    private static JasperReport compileReport(String reportTemplatePath) {
        final JasperReport report;
        try (InputStream reportTemplateStream = ReportGeneratorService.class.getResourceAsStream(reportTemplatePath)) {
            report = JasperCompileManager.compileReport(reportTemplateStream);
        } catch (JRException | IOException e) {
            throw new RuntimeException(e);
        }
        return report;
    }

    public byte[] generateReleaseInfoReportLegacy(ReleaseInfoReport releaseInfoReport) {
        ObjectMapper objectMapper = new ObjectMapper();
        try (InputStream reportTemplateStream = this.getClass().getResourceAsStream("/reports/release-legacy.jasper");
             ByteArrayInputStream reportContentStream = new ByteArrayInputStream(objectMapper.writeValueAsBytes(releaseInfoReport))) {
            JasperReport report = (JasperReport) JRLoader.loadObject(reportTemplateStream);
            JsonDataSource jsonDataSource = new JsonDataSource(reportContentStream, "data");
            JasperPrint jasperPrint = JasperFillManager.fillReport(report, null, jsonDataSource);
            return JasperExportManager.exportReportToPdf(jasperPrint);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public Company getCompany() {
        return new Company(this.company,
                new Address()
                        .setAddress1(this.companyAddress)
                        .setCity(this.companyCity)
                        .setState(this.companyState)
                        .setZip(this.companyZip)
                        .setPhone1(this.companyPhone));
    }

    @Transactional
    public String generateForm(FormData formData) throws IOException {
        var docType = DocType.getByKey(formData.getFormType());
        var bytes = getReportBytes(formData, FORMS_MAP.get(docType));
        return this.recordForm(formData.getPatientNo(), bytes, docType);
    }

    private <T> String recordForm(int patientNo, byte[] bytes, DocType docType) throws IOException {
        var fileName = UUID.randomUUID() + ".pdf";
        var localPath = Path.of(this.documentLocalFolder + File.separator + fileName);
        log.info("Creating file {}", localPath.toString());
        if (new File(localPath.toString()).createNewFile()) {
            Files.write(localPath, bytes);
            var remotePath = Path.of(this.documentFolder + fileName);

            if (docType.getFormType() == FormType.EDocs) {
                Document eDoc = new Document()
                        .setCodeId(docType.getValue())
                        .setFormType(docType.getDisplayName())
                        .setPatientNo(patientNo)
                        .setRecordedOn(LocalDate.now().format(DateTimeFormatter.ISO_DATE))
                        .setExpiresOn(LocalDate.now().plusYears(1).format(DateTimeFormatter.ISO_DATE))
                        .setDocLink(remotePath.toString());
                this.documentRepository.save(eDoc);
            } else {
                HippaDocument doc = new HippaDocument()
                        .setFormType(docType.getDisplayName())
                        .setPatientNo(patientNo)
                        .setRecordedOn(LocalDate.now().format(DateTimeFormatter.ISO_DATE))
                        .setExpiresOn(LocalDate.now().plusYears(1).format(DateTimeFormatter.ISO_DATE))
                        .setDocLink(remotePath.toString());
                this.hippaDocumentRepository.save(doc);
            }

            return fileName;
        } else {
            throw new RuntimeException("Failed to create form file at " + localPath.toString());
        }
    }

    private byte[] getReportBytes(Object reportData, JasperReport report) {
        ObjectMapper objectMapper = new ObjectMapper();
        try (ByteArrayInputStream reportContentStream = new ByteArrayInputStream(objectMapper.writeValueAsBytes(reportData))) {
            JsonDataSource jsonDataSource = new JsonDataSource(reportContentStream, "data");
            JasperPrint jasperPrint = JasperFillManager.fillReport(report, new HashMap<>(), jsonDataSource);
            byte[] bytes = JasperExportManager.exportReportToPdf(jasperPrint);
            log.info("Returning report content {} bytes", bytes.length);
            return bytes;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    public byte[] generateCommissions(SchedulerApiController.PaymentComissionsRequest request) {
        var reportData = this.schedulerApiService.getPayments(request.provider(), request.insurances(), request.fromPaymentPeriod(), request.toPaymentPeriod());
        var objectMapper = new ObjectMapper();
        var report = FORMS_MAP.get(DocType.Commissions);
        try (ByteArrayInputStream reportContentStream = new ByteArrayInputStream(objectMapper.writeValueAsBytes(reportData))) {
            JsonDataSource jsonDataSource = new JsonDataSource(reportContentStream, "");
            var parameters = Maps.mutable.<String, Object>empty()
                    .withKeyValue("rate", this.commissionRate)
                    .withKeyValue("company", this.company)
                    .withKeyValue("companyAddress", this.companyAddress)
                    .withKeyValue("companyCity", this.companyCity)
                    .withKeyValue("companyState", this.companyState)
                    .withKeyValue("companyZip", this.companyZip)
                    .withKeyValue("companyPhone", this.companyPhone);

            JasperPrint jasperPrint = JasperFillManager.fillReport(report, parameters, jsonDataSource);
            byte[] bytes = JasperExportManager.exportReportToPdf(jasperPrint);
            log.info("Returning report content {} bytes", bytes.length);
            return bytes;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
