package com.modern.office.scheduler.repository;

import com.modern.office.scheduler.domain.Document;
import com.modern.office.scheduler.domain.HippaDocument;
import org.springframework.data.repository.CrudRepository;

public interface HippaDocumentRepository extends CrudRepository<HippaDocument, Integer> {
    Iterable<HippaDocument> findHippaDocumentsByPatientNo(int patientNo);
}
