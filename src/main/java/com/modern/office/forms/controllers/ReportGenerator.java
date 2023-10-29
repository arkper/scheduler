package com.modern.office.forms.controllers;

import com.modern.office.forms.domain.ReleaseInfoReport;
import com.modern.office.forms.services.ReportGeneratorService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/reports")
@RequiredArgsConstructor
public class ReportGenerator {
    private final ReportGeneratorService reportGeneratorService;

    @PostMapping(value = "/release-report/generate", produces = "application/pdf")
    public byte[] generateReleaseReport(@RequestBody ReleaseInfoReport releaseInfoReport) {
        return this.reportGeneratorService.generateReleaseInfoReport(releaseInfoReport);
    }
}
