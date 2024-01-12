package com.modern.office.forms.services;

import com.modern.office.domain.Document;
import com.modern.office.domain.HippaDocument;
import com.modern.office.repository.DocumentRepository;
import com.modern.office.repository.HippaDocumentRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.Comparator;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

import static java.util.stream.StreamSupport.stream;

@Service
@RequiredArgsConstructor
public class DocumentService{
    private final DocumentRepository documentRepository;
    private final HippaDocumentRepository hippaDocumentRepository;

    public Iterable<Document> getEDocuments(int patientNo) {
        return StreamSupport.stream(
                this.documentRepository.findDocumentsByPatientNo(patientNo).spliterator(), false)
                .sorted((d1, d2) -> LocalDate.parse(d1.getRecordedOn()).isAfter(LocalDate.parse(d2.getRecordedOn()))? 1 : 0).toList();
    }

    public Iterable<HippaDocument> getHippaDocuments(int patientNo) {
        return StreamSupport.stream(
            this.hippaDocumentRepository.findHippaDocumentsByPatientNo(patientNo).spliterator(), false)
                .sorted((d1, d2) -> LocalDate.parse(d1.getRecordedOn()).isAfter(LocalDate.parse(d2.getRecordedOn()))? 1 : 0).toList();
    }
}
