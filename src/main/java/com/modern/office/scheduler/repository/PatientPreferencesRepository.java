package com.modern.office.scheduler.repository;

import com.modern.office.scheduler.domain.PatientPreferences;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PatientPreferencesRepository extends CrudRepository<PatientPreferences, Integer> {
    public List<PatientPreferences> findPatientPreferencesByPatientNo(int patientNo);
}
