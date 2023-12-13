package com.modern.office.scheduler.services;

import com.modern.office.scheduler.domain.Document;
import com.modern.office.scheduler.domain.HippaDocument;
import com.modern.office.scheduler.domain.Provider;

import java.util.List;

public interface DocumentService {
    Iterable<Document> getEDocuments(int patientNo);
    Iterable<HippaDocument> getHippaDocuments(int patientNo);
}
