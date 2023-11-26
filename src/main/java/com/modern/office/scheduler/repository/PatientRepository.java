package com.modern.office.scheduler.repository;

import java.time.LocalDate;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.modern.office.scheduler.domain.Patient;

public interface PatientRepository extends CrudRepository<Patient, Integer> {
	Iterable<Patient> findPatientsByLastNameAndBirthDate(String lastName, LocalDate birthDate);
	Iterable<Patient> findPatientsByLastNameAndSalutation(String lastName, String salutation);

	@Query("select p from Patient p where p.lastName like ?1 and p.salutation like ?2")
	Iterable<Patient> findPatientsByLastNameAndSalutationLike (String lastName, String salutation);
}
