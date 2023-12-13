package com.modern.office.scheduler.services;

import com.modern.office.scheduler.domain.Document;
import com.modern.office.scheduler.domain.HippaDocument;
import com.modern.office.scheduler.repository.DocumentRepository;
import com.modern.office.scheduler.repository.HippaDocumentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class DocumentServiceImpl implements DocumentService{
    private final DocumentRepository documentRepository;
    private final HippaDocumentRepository hippaDocumentRepository;
    @Override
    public Iterable<Document> getEDocuments(int patientNo) {
        return this.documentRepository.findDocumentsByPatientNo(patientNo);
    }

    @Override
    public Iterable<HippaDocument> getHippaDocuments(int patientNo) {
        return this.hippaDocumentRepository.findHippaDocumentsByPatientNo(patientNo);
    }
}
