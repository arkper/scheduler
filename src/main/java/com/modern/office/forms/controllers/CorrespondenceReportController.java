package com.modern.office.forms.controllers;

import com.modern.office.forms.domain.CorrespondenceReportRequest;
import com.modern.office.forms.domain.CorrespondenceReportRecord;
import com.modern.office.forms.services.CorrespondenceReportService;
import com.modern.office.forms.services.ExcelExporter;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/correspondence")
@Slf4j
@RequiredArgsConstructor
public class CorrespondenceReportController {
    private final CorrespondenceReportService service;
    private final ExcelExporter exporter;

    @PostMapping(value = "", consumes = "application/json", produces = "application/json")
    public Iterable<CorrespondenceReportRecord> getReport(@RequestBody CorrespondenceReportRequest request)
    {
        return this.service.getReportData(request);
    }

    @PostMapping(value = "/download", consumes = "application/json", produces = MediaType.APPLICATION_OCTET_STREAM_VALUE)
    public ResponseEntity<byte[]> downloadReport(@RequestBody CorrespondenceReportRequest request) {
        try {
            return ResponseEntity.ok()
                    .contentType(MediaType.APPLICATION_OCTET_STREAM)
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"CorresponenceReport.xls")
                    .body(this.exporter.createExcelReport(this.service.getReportData(request)));
        } catch (Exception e) {
            log.error("Failed generating report.", e);
            return ResponseEntity.internalServerError().build();
        }
    }
}
