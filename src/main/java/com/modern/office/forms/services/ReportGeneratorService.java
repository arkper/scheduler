package com.modern.office.forms.services;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.modern.office.forms.domain.ReleaseInfoReport;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JsonDataSource;
import net.sf.jasperreports.engine.util.JRLoader;
import org.springframework.stereotype.Service;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.HashMap;

@Service
public class ReportGeneratorService {
    public byte[] generateReleaseInfoReport(ReleaseInfoReport releaseInfoReport) {
        ObjectMapper objectMapper = new ObjectMapper();
        try (InputStream reportTemplateStream = this.getClass().getResourceAsStream("/reports/release.jasper");
             ByteArrayInputStream reportContentStream = new ByteArrayInputStream(objectMapper.writeValueAsBytes(releaseInfoReport)))
        {
            JasperReport report = (JasperReport) JRLoader.loadObject(reportTemplateStream);
            JsonDataSource jsonDataSource = new JsonDataSource(reportContentStream, "data");
            JasperPrint jasperPrint = JasperFillManager.fillReport(report, new HashMap<>(), jsonDataSource);
            return JasperExportManager.exportReportToPdf(jasperPrint);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
