package com.modern.office.repository;

import org.springframework.data.repository.CrudRepository;

import com.modern.office.domain.PatientInsurance;

public interface PatientInsuranceRepository extends CrudRepository<PatientInsurance, Integer> {
	Iterable<PatientInsurance> findAllByPatientNo(int patientNo);
}
