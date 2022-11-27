package com.modern.office.scheduler.controllers;

import java.time.LocalDate;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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

import lombok.extern.slf4j.Slf4j;

@RestController("/")
@Slf4j
public class SchedulerApiController {

	private final SchedulerApiService schedulerApiService;

	public SchedulerApiController(final SchedulerApiService schedulerApiService) {
		this.schedulerApiService = schedulerApiService;
	}

	@GetMapping(value = "/addresses/{address-no}", produces = "application/json")
	public ResponseEntity<Address> getAddress(@PathVariable("address-no") int addressNo) {
		try {
			return ResponseEntity.ok().body(this.schedulerApiService.getAddress(addressNo));
		} catch (Exception e) {
			log.error("Failed getting address for id {} with error: {}", addressNo, e.getMessage(), e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).header("Error Message", e.getMessage())
					.build();
		}
	}

	@PostMapping(path = "/addresses", produces = "application/json", consumes = "application/json")
	public ResponseEntity<Address> save(@RequestBody Address address) {
		try {
			return ResponseEntity.ok().body(this.schedulerApiService.save(address));
		} catch (Exception e) {
			log.error("Failed saving address with error: {}", e.getMessage(), e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).header("Error Message", e.getMessage())
					.build();
		}
	}

	@GetMapping(path = "/services", produces = "application/json")
	public ResponseEntity<Iterable<Product>> getProducts() {
		try {
			return ResponseEntity.ok().body(this.schedulerApiService.getAvailableProducts());
		} catch (Exception e) {
			log.error("Failed getting products with error: {}", e.getMessage(), e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).header("Error Message", e.getMessage())
					.build();
		}
	}

	@GetMapping(path = "/providers", produces = "application/json")
	public ResponseEntity<List<Provider>> getProviders() {
		try {
			return ResponseEntity.ok().body(this.schedulerApiService.getProviders());
		} catch (Exception e) {
			log.error("Failed getting providers with error: {}", e.getMessage(), e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).header("Error Message", e.getMessage())
					.build();
		}
	}

	@GetMapping(path = "/insurances", produces = "application/json")
	public ResponseEntity<Iterable<Insurance>> getInsurances() {
		try {
			return ResponseEntity.ok().body(this.schedulerApiService.getInsurances());
		} catch (Exception e) {
			log.error("Failed getting insurances with error: {}", e.getMessage(), e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).header("Error Message", e.getMessage())
					.build();
		}
	}

	@GetMapping(path = "/provider-blocks/{provider-no}", produces = "application/json")
	public ResponseEntity<Iterable<ProviderBlock>> getProviderBlocks(@PathVariable("provider-no") int providerNo) {
		try {
			return ResponseEntity.ok().body(this.schedulerApiService.getByProviderNo(providerNo));
		} catch (Exception e) {
			log.error("Failed getting provider-blocks with error: {}", e.getMessage(), e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).header("Error Message", e.getMessage())
					.build();
		}
	}

	@GetMapping(path = "/appointments/{start-date}/{end-date}", produces = "application/json")
	public ResponseEntity<Iterable<Appointment>> getAppointments(@PathVariable("start-date") String startDate,
			@PathVariable("end-date") String endDate) {
		try {
			Iterable<Appointment> appointments = this.schedulerApiService
					.getAppointmentByApptDateBetween(LocalDate.parse(startDate), LocalDate.parse(endDate));

			return ResponseEntity.ok().body(appointments);
		} catch (Exception e) {
			log.error("Failed getting appointments for start date {} and end date {} with error: {}", startDate,
					endDate, e.getMessage(), e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).header("Error Message", e.getMessage())
					.build();
		}
	}

	@GetMapping(path = "/appointments/{provider-no}/{start-date}/{end-date}", produces = "application/json")
	public ResponseEntity<Iterable<Appointment>> getAppointmentsByProvider(@PathVariable("provider-no") int providerNo,
			@PathVariable("start-date") String startDate, @PathVariable("end-date") String endDate) {
		try {
			Iterable<Appointment> appointments = this.schedulerApiService.getAppointmentByProviderNoAndApptDateBetween(
					providerNo, LocalDate.parse(startDate), LocalDate.parse(endDate));

			return ResponseEntity.ok().body(appointments);
		} catch (Exception e) {
			log.error("Failed getting appointments for provider {} with error: {}", providerNo, e.getMessage(), e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).header("Error Message", e.getMessage())
					.build();
		}
	}

	@PostMapping(path = "/appointment", consumes = "application/json", produces = "application/json")
	public ResponseEntity<Appointment> save(@RequestBody Appointment appointment) {
		try {
			return ResponseEntity.ok().body(this.schedulerApiService.save(appointment));
		} catch (Exception e) {
			log.error("Failed saving appointment with error: {}", e.getMessage(), e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).header("Error Message", e.getMessage())
					.build();
		}
	}

	@GetMapping(path = "/patient-insurances/{patient-no}", produces = "application/json")
	public ResponseEntity<Iterable<PatientInsurance>> getPatientInsurances(@PathVariable("patient-no") int patientNo) {
		try {
			Iterable<PatientInsurance> insurances = this.schedulerApiService.getPatientInsurances(patientNo);

			return ResponseEntity.ok().body(insurances);
		} catch (Exception e) {
			log.error("Failed getting insurances for patient {} with error: {}", patientNo, e.getMessage(), e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).header("Error Message", e.getMessage())
					.build();
		}
	}

	@PostMapping(path = "/patient-insurances", consumes = "application/json", produces = "application/json")
	public ResponseEntity<PatientInsurance> save(@RequestBody PatientInsurance insurance) {
		try {
			return ResponseEntity.ok().body(this.schedulerApiService.save(insurance));
		} catch (Exception e) {
			log.error("Failed saving insurance {} with error: {}", insurance, e.getMessage(), e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).header("Error Message", e.getMessage())
					.build();
		}
	}

	@GetMapping(path = "/patients/{patient-no}", produces = "application/json")
	public ResponseEntity<Patient> getPatient(@PathVariable("patient-no") int patientNo) {
		try {
			return ResponseEntity.ok().body(this.schedulerApiService.getPatient(patientNo));
		} catch (Exception e) {
			log.error("Failed getting patient for id {} with error: {}", patientNo, e.getMessage(), e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).header("Error Message", e.getMessage())
					.build();
		}
	}

	@GetMapping(path = "/patients-by-birthdate/{last-name}/{birth-date}", produces = "application/json")
	public ResponseEntity<Iterable<Patient>> getPatientsByBirthdate(@PathVariable("last-name") String lastName,
			@PathVariable("birth-date") LocalDate birthDate) {
		try {
			return ResponseEntity.ok()
					.body(this.schedulerApiService.findPatientsByLastNameAndBirthDate(lastName, birthDate));
		} catch (Exception e) {
			log.error("Failed getting patients for lastName {} and birthdate with error: {}", lastName, birthDate,
					e.getMessage(), e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).header("Error Message", e.getMessage())
					.build();
		}
	}

	@GetMapping(path = "/patients-by-name/{last-name}/{first-name}", produces = "application/json")
	public ResponseEntity<Iterable<Patient>> getPatientsByName(@PathVariable("last-name") String lastName,
			@PathVariable("first-name") String firstName) {
		try {
			return ResponseEntity.ok()
					.body(this.schedulerApiService.findPatientsByLastNameAndFirstName(lastName, firstName));
		} catch (Exception e) {
			log.error("Failed getting patients for lastName {} and firstName with error: {}", lastName, firstName,
					e.getMessage(), e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).header("Error Message", e.getMessage())
					.build();
		}
	}

	@PostMapping(path = "/patients", consumes = "application/json", produces = "application/json")
	public ResponseEntity<Patient> save(@RequestBody Patient patient) {
		try {
			return ResponseEntity.ok().body(this.schedulerApiService.save(patient));
		} catch (Exception e) {
			log.error("Failed saving patient {} with error: {}", patient, e.getMessage(), e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).header("Error Message", e.getMessage())
					.build();
		}
	}
}
