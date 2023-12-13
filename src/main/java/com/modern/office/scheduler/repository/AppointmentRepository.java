package com.modern.office.scheduler.repository;

import java.time.LocalDate;

import org.springframework.data.repository.CrudRepository;

import com.modern.office.scheduler.domain.Appointment;

public interface AppointmentRepository extends CrudRepository< Appointment, Integer> {
	Iterable<Appointment> getAppointmentByApptDateBetween(LocalDate startDate, LocalDate endDate);
	Iterable<Appointment> getAppointmentByProviderNoAndApptDateBetween(int providerNo, LocalDate startDate, LocalDate endDate);
	Iterable<Appointment> getAppointmentByPatientNoAndApptDateBetween(int patientNo, LocalDate startDate, LocalDate endDate);
}
