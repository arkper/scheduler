package com.modern.office.forms.services;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.modern.office.forms.domain.ReleaseInfoReport;
import org.junit.jupiter.api.Test;

import java.io.IOException;

import static org.junit.jupiter.api.Assertions.*;

class ReportGeneratorServiceTest {

    @Test
    void generateReleaseInfoReport() throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        ReleaseInfoReport releaseInfoReport = objectMapper.readValue(this.getClass().getClassLoader().getResourceAsStream("release_report.json"), ReleaseInfoReport.class);
        byte[] bytes = new ReportGeneratorService().generateReleaseInfoReport(releaseInfoReport);

    }
}
