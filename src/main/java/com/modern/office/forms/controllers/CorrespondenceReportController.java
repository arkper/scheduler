package com.modern.office.forms.controllers;

import com.modern.office.forms.domain.CorrespondenceReportRequest;
import com.modern.office.forms.domain.CorrespondenceReportResponse;
import com.modern.office.forms.services.CorrespondenceReportService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/correspondence")
@Slf4j
@RequiredArgsConstructor
public class CorrespondenceReportController {
    private final CorrespondenceReportService service;

    @PostMapping(value = "", consumes = "application/json", produces = "application/json")
    public Iterable<CorrespondenceReportResponse> getReport(@RequestBody CorrespondenceReportRequest request)
    {
        return this.service.getReportData(request);
    }
}
