package com.modern.office.scheduler.services;

import java.time.LocalDate;
import java.util.List;
import java.util.Set;

import com.modern.office.domain.*;

public interface SchedulerApiService {
	Iterable<FrameRxOrder> getRxOrdersToNotify(LocalDate sinceDate);
	FrameRxOrder updateRxOrder(FrameRxOrder order);
	List<Provider> getAllProviders();
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

	Iterable<Patient> findPatientsByLastNameAndFirstNameLike(String lastName, String firstName);
	Patient save(Patient patient);
	Iterable<ProviderBlock> getByProviderNo(int providerNo);
	ProviderBlock save(ProviderBlock providerBlock);
	
	Iterable<ProviderException> getExceptionsByProviderNo(int providerNo);
	Iterable<ProviderException> getExceptionsByProviderNoAndExceptionDate(int providerNo, LocalDate fromDate, LocalDate toDate);

	Iterable<Appointment> getAppointmentByApptDate(LocalDate apptDate);
	Iterable<Appointment> getAppointmentByApptDateBetween(LocalDate startDate, LocalDate endDate);
	Iterable<Appointment> getAppointmentByProviderNoAndApptDateBetween(int providerNo, LocalDate startDate, LocalDate endDate);
	Iterable<Appointment> getAppointmentByPatientNoAndApptDateBetween(int patientNo, LocalDate startDate, LocalDate endDate);
	Iterable<Appointment> getAppointmentToConfirm(int confirmInd, int canceInd, int noAnswerInd);
	
	Appointment save(Appointment appointment);
	Appointment setShowInd(int apptNo, int state);
	Appointment cancel(int apptNo);
	Appointment confirm(int apptNo);
	Appointment setLeftMsgInd(int apptNo, int state);
	Iterable<Code> getCodesByCategory(int categoryNo);
	Set<Timeslot> getTimeslots(int providerNo, LocalDate fromDate, LocalDate toDate);
	
	Business getBusiness(int businessNo);

	List<PatientPreferences> getPatientPreferences(int patientNo);
	PatientPreferences savePatientPreferences(PatientPreferences patientPreferences);

	Iterable<PaymentComission> getPayments(String provider, List<String> insurance, LocalDate fromDate, LocalDate toDate);

	PaymentComission savePayment(PaymentComission paymentComission);

	void deletePayment(int id);
}
