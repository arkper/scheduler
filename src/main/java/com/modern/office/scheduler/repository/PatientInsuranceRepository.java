package com.modern.office.scheduler.repository;

import org.springframework.data.repository.CrudRepository;

import com.modern.office.scheduler.domain.PatientInsurance;

public interface PatientInsuranceRepository extends CrudRepository<PatientInsurance, Integer> {
	Iterable<PatientInsurance> findAllByPatientNo(int patientNo);
}
