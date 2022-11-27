package com.modern.office.scheduler.services;

import java.time.LocalDate;
import java.util.List;

import com.modern.office.scheduler.domain.Address;
import com.modern.office.scheduler.domain.Appointment;
import com.modern.office.scheduler.domain.Insurance;
import com.modern.office.scheduler.domain.Patient;
import com.modern.office.scheduler.domain.PatientInsurance;
import com.modern.office.scheduler.domain.Product;
import com.modern.office.scheduler.domain.Provider;
import com.modern.office.scheduler.domain.ProviderBlock;

public interface SchedulerApiService {
	List<Provider> getProviders();
	Provider save(Provider provider);
	Iterable<Insurance> getInsurances();
	Insurance save(Insurance insurance);
	Iterable<Product> getAvailableProducts();
	Address getAddress(int addressNo);
	Address save(Address address);
	void updatePhone(int addressNo, String newPhoneNumber);
	PatientInsurance save(PatientInsurance patientInsurance);
	Iterable<PatientInsurance> getPatientInsurances(int patientNo);
	Patient getPatient(int patientNo);
	Iterable<Patient> findPatientsByLastNameAndBirthDate(String lastName, LocalDate birthDate);
	Iterable<Patient> findPatientsByLastNameAndFirstName(String lastName, String firstName);
	Patient save(Patient patient);
	Iterable<ProviderBlock> getByProviderNo(int providerNo);
	ProviderBlock save(ProviderBlock providerBlock);
	Iterable<Appointment> getAppointmentByApptDateBetween(LocalDate startDate, LocalDate endDate);
	Iterable<Appointment> getAppointmentByProviderNoAndApptDateBetween(int providerNo, LocalDate startDate, LocalDate endDate);
	Appointment save(Appointment appointment);
}
