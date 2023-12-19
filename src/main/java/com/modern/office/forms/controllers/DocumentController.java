package com.modern.office.forms.controllers;

import com.modern.office.domain.Document;
import com.modern.office.domain.HippaDocument;
import com.modern.office.forms.services.DocumentService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController("/documents")
@Slf4j
@RequiredArgsConstructor
public class DocumentController {
    private final DocumentService documentService;

    @GetMapping(value = "/documents/e-docs/{patient-no}", produces = "application/json")
    public Iterable<Document> getEDocuments(@PathVariable("patient-no") int patientNo)
    {
        return this.documentService.getEDocuments(patientNo);
    }

    @GetMapping(value = "/documents/hippa-docs/{patient-no}", produces = "application/json")
    public Iterable<HippaDocument> getHippaDocuments(@PathVariable("patient-no") int patientNo)
    {
        return this.documentService.getHippaDocuments(patientNo);
    }
}
