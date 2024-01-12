package com.modern.office.forms.services;

import com.modern.office.domain.Document;
import com.modern.office.domain.HippaDocument;
import com.modern.office.repository.DocumentRepository;
import com.modern.office.repository.HippaDocumentRepository;
import lombok.RequiredArgsConstructor;
import org.eclipse.collections.impl.factory.Lists;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class DocumentService {
    private final DocumentRepository documentRepository;
    private final HippaDocumentRepository hippaDocumentRepository;

    public Iterable<Document> getEDocuments(int patientNo) {
        return Lists.mutable.withAll(
                        this.documentRepository.findDocumentsByPatientNo(patientNo))
                .sortThisBy(Document::getSysId).reverseThis();
    }

    public Iterable<HippaDocument> getHippaDocuments(int patientNo) {
        return Lists.mutable.withAll(
                        this.hippaDocumentRepository.findHippaDocumentsByPatientNo(patientNo))
                .sortThisBy(Document::getSysId).reverseThis();
    }
}
