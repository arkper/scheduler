package com.modern.office.scheduler.repository;

import com.modern.office.scheduler.domain.Code;
import com.modern.office.scheduler.domain.Document;
import org.springframework.data.repository.CrudRepository;

public interface DocumentRepository extends CrudRepository<Document, Integer> {
    Iterable<Document> findDocumentsByPatientNo(int patientNo);
}
