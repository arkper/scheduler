package com.modern.office.forms.services;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.modern.office.forms.domain.*;
import com.modern.office.scheduler.domain.Address;
import com.modern.office.scheduler.domain.Document;
import com.modern.office.scheduler.domain.HippaDocument;
import com.modern.office.scheduler.repository.DocumentRepository;
import com.modern.office.scheduler.repository.HippaDocumentRepository;
import lombok.extern.slf4j.Slf4j;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JsonDataSource;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.util.Pair;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.swing.text.DateFormatter;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.time.LocalDate;
import java.time.Year;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Service
@Slf4j
public class ReportGeneratorService {
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

    private static final Map<Class<?>, Pair<DocType, JasperReport>> FORMS_INFO = new HashMap<>();

    private final DocumentRepository documentRepository;
    private final HippaDocumentRepository hippaDocumentRepository;

    @Value("${office-forms.document-folder}")
    private String documentFolder;

    public ReportGeneratorService(final DocumentRepository documentRepository,
                                  final HippaDocumentRepository hippaDocumentRepository) throws IOException {
        this.documentRepository = documentRepository;
        this.hippaDocumentRepository = hippaDocumentRepository;

        FORMS_INFO.put(ConsentRecord.class, Pair.of(DocType.Consent, compileReport(DocType.Consent.getTemplate())));
        FORMS_INFO.put(ReleaseRecord.class, Pair.of(DocType.ReleaseOfMedicalInfo, compileReport(DocType.ReleaseOfMedicalInfo.getTemplate())));
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
    public <T extends ReportRecord> String generateReport(OfficeForm<T> officeForm, Class<T> clazz) throws IOException {
        T reportRecord = (T) getReportRecord(officeForm);

        var bytes = getReportBytes(officeForm, FORMS_INFO.get(clazz).getSecond());

        return this.recordForm(reportRecord.getPatientNo(), bytes, clazz);
    }

    private <T extends ReportRecord> ReportRecord getReportRecord(OfficeForm<T> officeForm) {
        T reportRecord = officeForm.getData().get(0);
        String signature = reportRecord.getSignature();
        signature = StringUtils.substringAfter(signature, "data:image/png;base64,");
        reportRecord.setCompany(this.company);
        reportRecord.setSignature(signature);
        officeForm.setData(Collections.singletonList(reportRecord));
        return reportRecord;
    }

    private <T> String recordForm(int patientNo, byte[] bytes, Class<T> clazz) throws IOException {
        var fileName = UUID.randomUUID() + ".pdf";
        Path path = Path.of(this.documentFolder + "/" + fileName);
        Files.createFile(path);
        Files.write(path, bytes);
        var docType = FORMS_INFO.get(clazz).getFirst();

        if (docType.getFormType() == FormType.EDocs) {
            Document eDoc = new Document()
                    .setCodeId(docType.getValue())
                    .setFormType(docType.getDisplayName())
                    .setPatientNo(patientNo)
                    .setRecordedOn(LocalDate.now().format(DateTimeFormatter.ISO_DATE))
                    .setExpiresOn(LocalDate.now().plusYears(1).format(DateTimeFormatter.ISO_DATE))
                    .setDocLink(path.toString());
            this.documentRepository.save(eDoc);
        }
        else {
            HippaDocument doc = new HippaDocument()
                    .setFormType(docType.getDisplayName())
                    .setPatientNo(patientNo)
                    .setRecordedOn(LocalDate.now().format(DateTimeFormatter.ISO_DATE))
                    .setExpiresOn(LocalDate.now().plusYears(1).format(DateTimeFormatter.ISO_DATE))
                    .setDocLink(path.toString());
            this.hippaDocumentRepository.save(doc);
        }

        return fileName;
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

    private static JasperReport compileReport(String reportTemplatePath) {
        final JasperReport report;
        try (InputStream reportTemplateStream = ReportGeneratorService.class.getResourceAsStream(reportTemplatePath)) {
            report = JasperCompileManager.compileReport(reportTemplateStream);
        } catch (JRException | IOException e) {
            throw new RuntimeException(e);
        }
        return report;
    }
}
