package com.modern.office.repository;

import com.modern.office.domain.PatientPreferences;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface PatientPreferencesRepository extends CrudRepository<PatientPreferences, Integer> {
    public List<PatientPreferences> findPatientPreferencesByPatientNo(int patientNo);
}
