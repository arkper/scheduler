package com.modern.office.forms.services;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.modern.office.forms.domain.ReleaseInfoReport;
import lombok.extern.slf4j.Slf4j;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JsonDataSource;
import org.springframework.stereotype.Service;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;

@Service
@Slf4j
public class ReportGeneratorService {
    private final JasperReport releaseReport;

    public ReportGeneratorService() throws IOException {
        try (InputStream reportTemplateStream = this.getClass().getResourceAsStream("/reports/release.jrxml"))
        {
            releaseReport = JasperCompileManager.compileReport(reportTemplateStream);
        } catch (JRException e) {
            throw new RuntimeException(e);
        }

    }

    public byte[] generateReleaseInfoReport(ReleaseInfoReport releaseInfoReport) {
        ObjectMapper objectMapper = new ObjectMapper();
        try (ByteArrayInputStream reportContentStream = new ByteArrayInputStream(objectMapper.writeValueAsBytes(releaseInfoReport)))
        {
            JsonDataSource jsonDataSource = new JsonDataSource(reportContentStream, "data");
            JasperPrint jasperPrint = JasperFillManager.fillReport(releaseReport, new HashMap<>(), jsonDataSource);
            byte[] bytes = JasperExportManager.exportReportToPdf(jasperPrint);
            log.info("Returning report content {} bytes", bytes.length);
            return bytes;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
