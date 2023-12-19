package com.modern.office.repository;

import com.modern.office.domain.HippaDocument;
import org.springframework.data.repository.CrudRepository;

public interface HippaDocumentRepository extends CrudRepository<HippaDocument, Integer> {
    Iterable<HippaDocument> findHippaDocumentsByPatientNo(int patientNo);
}
