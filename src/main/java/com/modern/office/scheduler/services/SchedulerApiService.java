package com.modern.office.scheduler.services;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

import com.modern.office.scheduler.domain.Address;
import com.modern.office.scheduler.domain.Appointment;
import com.modern.office.scheduler.domain.Code;
import com.modern.office.scheduler.domain.Insurance;
import com.modern.office.scheduler.domain.InsurancePlan;
import com.modern.office.scheduler.domain.Patient;
import com.modern.office.scheduler.domain.PatientInsurance;
import com.modern.office.scheduler.domain.Product;
import com.modern.office.scheduler.domain.Provider;
import com.modern.office.scheduler.domain.ProviderBlock;
import com.modern.office.scheduler.domain.ProviderException;
import com.modern.office.scheduler.domain.Timeslot;

public interface SchedulerApiService {
	List<Provider> getProviders();
	Provider save(Provider provider);
	Iterable<Insurance> getInsurances();
	Insurance save(Insurance insurance);
	Iterable<InsurancePlan> getInsurancePlans(int insuranceNo);
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
	
	Iterable<ProviderException> getExceptionsByProviderNo(int providerNo);
	Iterable<ProviderException> getExceptionsByProviderNoAndExceptionDate(int providerNo, LocalDate fromDate, LocalDate toDate);
	
	Iterable<Appointment> getAppointmentByApptDateBetween(LocalDate startDate, LocalDate endDate);
	Iterable<Appointment> getAppointmentByProviderNoAndApptDateBetween(int providerNo, LocalDate startDate, LocalDate endDate);
	Iterable<Appointment> getAppointmentByPatientNoAndApptDateBetween(int patientNo, LocalDate startDate, LocalDate endDate);
	Iterable<Appointment> getAppointmentToConfirm();
	
	Appointment save(Appointment appointment);
	Appointment cancel(int apptNo);
	Appointment confirm(int apptNo);
	Iterable<Code> getCodesByCategory(int categoryNo);
	Set<Timeslot> getTimeslots(int providerNo, LocalDate fromDate, LocalDate toDate);
}
