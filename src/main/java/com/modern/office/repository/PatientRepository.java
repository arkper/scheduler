package com.modern.office.repository;

import java.time.LocalDate;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.modern.office.domain.Patient;

public interface PatientRepository extends CrudRepository<Patient, Integer> {
	Iterable<Patient> findPatientsByLastNameAndBirthDate(String lastName, LocalDate birthDate);
	Iterable<Patient> findPatientsByLastNameAndSalutation(String lastName, String salutation);

	@Query(value = "select top 100 * from patient where last_name like ?1 and salutation like ?2", nativeQuery = true)
	Iterable<Patient> findPatientsByLastNameAndSalutationLike (String lastName, String salutation);
}
