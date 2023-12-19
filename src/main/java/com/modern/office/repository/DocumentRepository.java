package com.modern.office.repository;

import com.modern.office.domain.Document;
import org.springframework.data.repository.CrudRepository;

public interface DocumentRepository extends CrudRepository<Document, Integer> {
    Iterable<Document> findDocumentsByPatientNo(int patientNo);
}
