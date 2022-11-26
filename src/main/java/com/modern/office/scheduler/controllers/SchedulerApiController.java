package com.modern.office.scheduler.controllers;

import java.time.LocalDate;

import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.modern.office.scheduler.domain.Address;
import com.modern.office.scheduler.domain.Appointment;
import com.modern.office.scheduler.domain.Insurance;
import com.modern.office.scheduler.domain.Patient;
import com.modern.office.scheduler.domain.PatientInsurance;
import com.modern.office.scheduler.domain.Product;
import com.modern.office.scheduler.domain.Provider;
import com.modern.office.scheduler.domain.ProviderBlock;
import com.modern.office.scheduler.services.SchedulerApiService;

@RestController("/")
public class SchedulerApiController {
	
	private final SchedulerApiService schedulerApiService;
	
	public SchedulerApiController(final SchedulerApiService schedulerApiService)
	{
		this.schedulerApiService = schedulerApiService;
	}

	@GetMapping(value = "/addresses/{address-no}", produces = "application/json")
	public ResponseEntity<Address> getAddress(@PathVariable("address-no") int addressNo)
	{
		return ResponseEntity.ok().body(this.schedulerApiService.getAddress(addressNo));
	}

	@PostMapping(path = "/addresses", produces = "application/json", consumes = "application/json")
	public ResponseEntity<Address> save(@RequestBody Address address)
	{
		return ResponseEntity.ok().body(this.schedulerApiService.save(address));
	}

	@GetMapping(path = "/services", produces = "application/json")
	public ResponseEntity<Iterable<Product>> getProducts()
	{
		return ResponseEntity.ok().body(this.schedulerApiService.getAvailableProducts());
	}

	@GetMapping(path = "/providers", produces = "application/json")
	public ResponseEntity<Iterable<Provider>> getProviders()
	{
		return ResponseEntity.ok().body(this.schedulerApiService.getProviders());
	}

	//@PostMapping(path = "/providers", produces = "application/json", consumes = "application/json")
	public ResponseEntity<Provider> saveProvider(@RequestBody final Provider provider)
	{
		return ResponseEntity.ok().body(this.schedulerApiService.save(provider));
	}

	@GetMapping(path = "/insurances", produces = "application/json")
	public ResponseEntity<Iterable<Insurance>> getInsurances()
	{
		return ResponseEntity.ok().body(this.schedulerApiService.getInsurances());
	}

	//@PostMapping(path = "/insurances", produces = "application/json", consumes = "application/json")
	public ResponseEntity<Insurance> saveInsurance(@RequestBody final Insurance insurance)
	{
		return ResponseEntity.ok().body(this.schedulerApiService.save(insurance));
	}

	@GetMapping(path = "/provider-blocks/{provider-no}", produces = "application/json")
	public ResponseEntity<Iterable<ProviderBlock>> getProviderBlocks(@PathVariable("provider-no") int providerNo)
	{
		return ResponseEntity.ok().body(this.schedulerApiService.getByProviderNo(providerNo));
	}

	//@PostMapping(path = "/provider-block", produces = "application/json", consumes = "application/json")
	public ResponseEntity<ProviderBlock> saveProviderBlock(@RequestBody final ProviderBlock providerBlock)
	{
		return ResponseEntity.ok().body(this.schedulerApiService.save(providerBlock));
	}

	@GetMapping(path = "/appointments/{start-date}/{end-date}", produces = "application/json")
	public ResponseEntity<Iterable<Appointment>> getAppointments(
			@PathVariable("start-date") String startDate,
			@PathVariable("end-date") String endDate)
	{
		Iterable<Appointment> appointments = this.schedulerApiService.getAppointmentByApptDateBetween(
				LocalDate.parse(startDate), LocalDate.parse(endDate));
		
		return ResponseEntity.ok().body(appointments);
	}
	
	@GetMapping(path = "/appointments/{provider-no}/{start-date}/{end-date}", produces = "application/json")
	public ResponseEntity<Iterable<Appointment>> getAppointmentsByProvider(
			@PathVariable("provider-no") int providerNo,
			@PathVariable("start-date") String startDate,
			@PathVariable("end-date") String endDate)
	{
		Iterable<Appointment> appointments = this.schedulerApiService.getAppointmentByProviderNoAndApptDateBetween(
				providerNo, LocalDate.parse(startDate), LocalDate.parse(endDate));
		
		return ResponseEntity.ok().body(appointments);
	}

	@PostMapping(path = "/appointment", consumes = "application/json", produces = "application/json" )
	public ResponseEntity<Appointment> save(@RequestBody Appointment appointment)
	{
		return ResponseEntity.ok().body(this.schedulerApiService.save(appointment));
	}

	@GetMapping(path = "/patient-insurances/{patient-no}", produces = "application/json")
	public ResponseEntity<Iterable<PatientInsurance>> getPatientInsurances(
			@PathVariable("patient-no") int patientNo)
	{
		Iterable<PatientInsurance> insurances = this.schedulerApiService.getPatientInsurances(
				patientNo);
		
		return ResponseEntity.ok().body(insurances);
	}

	@PostMapping(path = "/patient-insurances", consumes = "application/json", produces = "application/json" )
	public ResponseEntity<PatientInsurance> save(@RequestBody PatientInsurance insurance)
	{
		return ResponseEntity.ok().body(this.schedulerApiService.save(insurance));
	}

	@GetMapping(path = "/patients/{patient-no}", produces = "application/json")
	public ResponseEntity<Patient> getPatient(
			@PathVariable("patient-no") int patientNo)
	{
		return ResponseEntity.ok().body(this.schedulerApiService.getPatient(patientNo));
	}

	@GetMapping(path = "/patients-by-birthdate/{last-name}/{birth-date}", produces = "application/json")
	public ResponseEntity<Iterable<Patient>> getPatientsByBirthdate(
			@PathVariable("last-name") String lastName,
			@PathVariable("birth-date") LocalDate birthDate)
	{
		return ResponseEntity.ok().body(this.schedulerApiService.findPatientsByLastNameAndBirthDate(lastName, birthDate));
	}

	@GetMapping(path = "/patients-by-name/{last-name}/{first-name}", produces = "application/json")
	public ResponseEntity<Iterable<Patient>> getPatientsByName(
			@PathVariable("last-name") String lastName,
			@PathVariable("first-name") String firstName)
	{
		return ResponseEntity.ok().body(this.schedulerApiService.findPatientsByLastNameAndFirstName(lastName, firstName));
	}

	@PostMapping(path = "/patients", consumes = "application/json", produces = "application/json" )
	public ResponseEntity<Patient> save(@RequestBody Patient patient)
	{
		return ResponseEntity.ok().body(this.schedulerApiService.save(patient));
	}
}
