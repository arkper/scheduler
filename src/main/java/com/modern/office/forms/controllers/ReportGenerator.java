package com.modern.office.forms.controllers;

import com.modern.office.forms.domain.ReleaseInfoReport;
import com.modern.office.forms.services.ReportGeneratorService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController("/")
@RequiredArgsConstructor
public class ReportGenerator {
    private final ReportGeneratorService reportGeneratorService;

    @PostMapping("/release-report/generate")
    public byte[] generateReleaseReport(@RequestBody ReleaseInfoReport releaseInfoReport) {
        return this.reportGeneratorService.generateReleaseInfoReport(releaseInfoReport);
    }
}
