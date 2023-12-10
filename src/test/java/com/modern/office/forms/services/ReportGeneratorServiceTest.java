package com.modern.office.forms.services;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.modern.office.forms.domain.OfficeForm;
import com.modern.office.forms.domain.ReleaseRecord;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;

import java.io.IOException;

class ReportGeneratorServiceTest {

    @Disabled
    void generateReleaseInfoReport() throws IOException {
        ObjectMapper objectMapper = new ObjectMapper();
        OfficeForm<ReleaseRecord> releaseData = objectMapper.readValue(this.getClass().getClassLoader().getResourceAsStream("release_report.json"), OfficeForm.class);
        // byte[] bytes = new ReportGeneratorService().generateReport(releaseData, ReleaseRecord.class);
        // Assertions.assertTrue(bytes.length > 0);
    }
}
