package com.modern.office.scheduler.repository;

import java.time.LocalDate;

import org.springframework.data.repository.CrudRepository;

import com.modern.office.scheduler.domain.Patient;

public interface PatientRepository extends CrudRepository<Patient, Integer> {
	Iterable<Patient> findPatientsByLastNameAndBirthDate(String lastName, LocalDate birthDate);
	Iterable<Patient> findPatientsByLastNameAndSalutation(String lastName, String salutation);
}
