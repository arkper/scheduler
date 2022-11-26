package com.modern.office.scheduler.services;

import java.time.LocalDate;

import org.springframework.stereotype.Service;

import com.modern.office.scheduler.domain.Address;
import com.modern.office.scheduler.domain.Appointment;
import com.modern.office.scheduler.domain.Insurance;
import com.modern.office.scheduler.domain.Patient;
import com.modern.office.scheduler.domain.PatientInsurance;
import com.modern.office.scheduler.domain.Product;
import com.modern.office.scheduler.domain.Provider;
import com.modern.office.scheduler.domain.ProviderBlock;
import com.modern.office.scheduler.repository.AddressRepository;
import com.modern.office.scheduler.repository.AppointmentRepository;
import com.modern.office.scheduler.repository.InsuranceRepository;
import com.modern.office.scheduler.repository.PatientInsuranceRepository;
import com.modern.office.scheduler.repository.PatientRepository;
import com.modern.office.scheduler.repository.ProductRepository;
import com.modern.office.scheduler.repository.ProviderBlockRepository;
import com.modern.office.scheduler.repository.ProviderRepository;

@Service
public class SchedulerApiServiceImpl implements SchedulerApiService {
	private final ProviderRepository providerRepo;
	private final InsuranceRepository insuranceRepo;
	private final ProviderBlockRepository providerBlockRepo;
	private final AppointmentRepository appointmentRepo;
	private final ProductRepository productRepo;
	private final AddressRepository addressRepo;
	private final PatientInsuranceRepository patientInsuranceRepo;
	private final PatientRepository patientRepo;

	
	public SchedulerApiServiceImpl(final ProviderRepository providerRepo,
			final InsuranceRepository insuranceRepo,
			final ProviderBlockRepository providerBlockRepo,
			final AppointmentRepository appointmentRepo,
			final ProductRepository productRepo,
			final AddressRepository addressRepo,
			final PatientInsuranceRepository patientInsuranceRepo,
			final PatientRepository patientRepo)
	{
		this.providerRepo = providerRepo;
		this.insuranceRepo = insuranceRepo;
		this.providerBlockRepo = providerBlockRepo;
		this.appointmentRepo = appointmentRepo;
		this.productRepo = productRepo;
		this.addressRepo = addressRepo;
		this.patientInsuranceRepo = patientInsuranceRepo;
		this.patientRepo = patientRepo;
	}

	@Override
	public Iterable<Provider> getProviders() {
		return this.providerRepo.getProviderByIsProviderAndProviderActive(1, true);
	}

	@Override
	public Iterable<Insurance> getInsurances() {
		return this.insuranceRepo.findAll();
	}

	@Override
	public Iterable<ProviderBlock> getByProviderNo(int providerNo) {
		return this.providerBlockRepo.findAllByProviderNo(providerNo);
	}

	@Override
	public Iterable<Appointment> getAppointmentByApptDateBetween(LocalDate startDate, LocalDate endDate) {
		return this.appointmentRepo.getAppointmentByApptDateBetween(startDate, endDate);
	}

	@Override
	public Appointment save(Appointment appointment) {
		return this.appointmentRepo.save(appointment);
	}

	@Override
	public Iterable<Appointment> getAppointmentByProviderNoAndApptDateBetween(
			int providerNo, 
			LocalDate startDate,
			LocalDate endDate) {
		return appointmentRepo.getAppointmentByProviderNoAndApptDateBetween(providerNo, startDate, endDate);
	}

	@Override
	public Provider save(Provider provider) {
		return this.providerRepo.save(provider);
	}

	@Override
	public Insurance save(Insurance insurance) {
		return this.insuranceRepo.save(insurance);
	}

	@Override
	public ProviderBlock save(ProviderBlock providerBlock) {
		return this.providerBlockRepo.save(providerBlock);
	}

	@Override
	public Iterable<Product> getAvailableProducts() {
		return this.productRepo.getProductsByProductAvailable(1);
	}
	
	@Override
	public Address getAddress(int addressNo)
	{
		return this.addressRepo.findById(addressNo).orElse(null);
	}

	@Override
	public Address save(Address address) {
		return this.addressRepo.save(address);
	}

	@Override
	public PatientInsurance save(PatientInsurance patientInsurance) {
		return this.patientInsuranceRepo.save(patientInsurance);
	}

	@Override
	public Iterable<PatientInsurance> getPatientInsurances(int patientNo) {
		return this.patientInsuranceRepo.findAllByPatientNo(patientNo);
	}

	@Override
	public Iterable<Patient> findPatientsByLastNameAndBirthDate(String lastName, LocalDate birthDate) {
		return this.patientRepo.findPatientsByLastNameAndBirthDate(lastName, birthDate);
	}

	@Override
	public Iterable<Patient> findPatientsByLastNameAndFirstName(String lastName, String firstName) {
		return this.patientRepo.findPatientsByLastNameAndSalutation(lastName, "Dear " + firstName + ":");
	}

	@Override
	public Patient save(Patient patient) {
		Patient saved = this.patientRepo.save(patient);
		patient.getPatientInsurances()
		    .forEach(pi -> this.patientInsuranceRepo.save(pi.setPatientNo(patient.getPatientNo()).setInsuredNo(patient.getPatientNo())));
		
		return saved;
	}

	@Override
	public Patient getPatient(int patientNo) {
		return this.patientRepo.findById(patientNo).orElse(null);
	}
}
