package com.modern.office.scheduler.controllers;

import java.time.LocalDate;
import java.util.List;
import java.util.Objects;

import com.modern.office.config.ClientMappings;
import com.modern.office.domain.*;
import jakarta.servlet.http.HttpServletRequest;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.collections.api.tuple.Pair;
import org.eclipse.collections.impl.factory.Maps;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.modern.office.scheduler.services.SchedulerApiService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@CrossOrigin("*")
@RestController("/")
@Slf4j
@RequiredArgsConstructor
public class SchedulerApiController {

	private final SchedulerApiService schedulerApiService;

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

	@PostMapping(path = "/addresses/{address-no}/update-phone/{phone-number}", produces = "application/json")
	public ResponseEntity<Void> save(@PathVariable("address-no") final int addressNo,
			@PathVariable("phone-number") final String phoneNumber) {
		try {
			this.schedulerApiService.updatePhone(addressNo, phoneNumber);
			return ResponseEntity.ok().build();
		} catch (Exception e) {
			log.error("Failed updating address with error: {}", e.getMessage(), e);
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

	@GetMapping(path = "/insurance-plans/{insurance-no}", produces = "application/json")
	public ResponseEntity<Iterable<InsurancePlan>> getInsurancePlans(@PathVariable("insurance-no") int insuranceNo) {
		try {
			return ResponseEntity.ok().body(this.schedulerApiService.getInsurancePlans(insuranceNo));
		} catch (Exception e) {
			log.error("Failed getting insurance plans with error: {}", e.getMessage(), e);
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

	@GetMapping(path = "/patient-appointments/{patient-no}/{start-date}/{end-date}", produces = "application/json")
	public ResponseEntity<Iterable<Appointment>> getAppointmentsByPatient(@PathVariable("patient-no") int patientNo,
			@PathVariable("start-date") String startDate, @PathVariable("end-date") String endDate) {
		try {
			Iterable<Appointment> appointments = this.schedulerApiService.getAppointmentByPatientNoAndApptDateBetween(
					patientNo, LocalDate.parse(startDate), LocalDate.parse(endDate));

			return ResponseEntity.ok().body(appointments);
		} catch (Exception e) {
			log.error("Failed getting appointments for patient {} with error: {}", patientNo, e.getMessage(), e);
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

	@PostMapping(path = "/appointment/{appt-no}/cancel", produces = "application/json")
	public ResponseEntity<Appointment> cancel(@PathVariable("appt-no") int apptNo) {
		try {
			return ResponseEntity.ok().body(this.schedulerApiService.cancel(apptNo));
		} catch (Exception e) {
			log.error("Failed cancelling appointment with error: {}", e.getMessage(), e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).header("Error Message", e.getMessage())
					.build();
		}
	}

	@PostMapping(path = "/appointment/{appt-no}/show", produces = "application/json")
	public ResponseEntity<Appointment> show(@PathVariable("appt-no") int apptNo) {
		try {
			return ResponseEntity.ok().body(this.schedulerApiService.setShowInd(apptNo, 1));
		} catch (Exception e) {
			log.error("Failed updating appointment with error: {}", e.getMessage(), e);
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
			@PathVariable("birth-date") @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate birthDate) {
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
	@CrossOrigin
	public ResponseEntity<Iterable<Patient>> getPatientsByName(@PathVariable("last-name") String lastName,
			@PathVariable("first-name") String firstName) {
		try {
			return ResponseEntity.ok()
					.body(this.schedulerApiService.findPatientsByLastNameAndFirstName(lastName, firstName));
		} catch (Exception e) {
			log.error("Failed getting patients for lastName {} and firstName {} with error: {}", lastName, firstName,
					e.getMessage(), e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).header("Error Message", e.getMessage())
					.build();
		}
	}

	@GetMapping(path = "/patients-by-name-like/{last-name}/{first-name}", produces = "application/json")
	@CrossOrigin
	public ResponseEntity<Iterable<Patient>> getPatientsByNameLike(@PathVariable("last-name") String lastName,
															   @PathVariable("first-name") String firstName) {
		try {
			return ResponseEntity.ok()
					.body(this.schedulerApiService.findPatientsByLastNameAndFirstNameLike(lastName, firstName));
		} catch (Exception e) {
			log.error("Failed getting patients for lastName {} and firstName {} with error: {}", lastName, firstName,
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

	@GetMapping(path = "/provider-exceptions/{provider-no}", produces = "application/json")
	public ResponseEntity<Iterable<ProviderException>> getProviderExceptionsByProvider(
			@PathVariable("provider-no") int providerNo) {
		try {
			return ResponseEntity.ok().body(this.schedulerApiService.getExceptionsByProviderNo(providerNo));
		} catch (Exception e) {
			log.error("Failed getting provider exceptions for providerNo {} with error: {}", providerNo, e.getMessage(),
					e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).header("Error Message", e.getMessage())
					.build();
		}
	}

	@GetMapping(path = "/provider-exceptions/{provider-no}/{from-date}/{to-date}", produces = "application/json")
	public ResponseEntity<Iterable<ProviderException>> getProviderExceptionsByProviderAndDate(
			@PathVariable("provider-no") final int providerNo,
			@PathVariable("from-date") @DateTimeFormat(pattern = "yyyy-MM-dd") final LocalDate fromDate,
			@PathVariable("to-date") @DateTimeFormat(pattern = "yyyy-MM-dd") final LocalDate toDate) {
		try {
			return ResponseEntity.ok().body(
					this.schedulerApiService.getExceptionsByProviderNoAndExceptionDate(providerNo, fromDate, toDate));
		} catch (Exception e) {
			log.error("Failed getting provider exceptions for providerNo {} with error: {}", providerNo, e.getMessage(),
					e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).header("Error Message", e.getMessage())
					.build();
		}
	}

	@GetMapping(path = "/codes/{category}", produces = "application/json")
	public ResponseEntity<Iterable<Code>> getCodesByCategory(@PathVariable("category") CodeCategory category) {
		try {
			return ResponseEntity.ok().body(this.schedulerApiService.getCodesByCategory(category.getValue()));
		} catch (Exception e) {
			log.error("Failed getting codes for category {} with error: {}", category, e.getMessage(), e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).header("Error Message", e.getMessage())
					.build();
		}
	}

	@GetMapping(path = "/codes-by-category-no/{category-no}", produces = "application/json")
	public ResponseEntity<Iterable<Code>> getCodesByCategoryNo(@PathVariable("category-no") int categoryNo) {
		try {
			return ResponseEntity.ok().body(this.schedulerApiService.getCodesByCategory(categoryNo));
		} catch (Exception e) {
			log.error("Failed getting codes for category {} with error: {}", categoryNo, e.getMessage(), e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).header("Error Message", e.getMessage())
					.build();
		}
	}

	@GetMapping(path = "/timeslots/{provider-no}/{from-date}/{to-date}", produces = "application/json")
	public ResponseEntity<Iterable<Timeslot>> getTimeslots(@PathVariable("provider-no") int providerNo,
			@PathVariable("from-date") @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate fromDate,
			@PathVariable("to-date") @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate toDate) {
		try {
			return ResponseEntity.ok().body(this.schedulerApiService.getTimeslots(providerNo, fromDate, toDate));
		} catch (Exception e) {
			log.error("Failed getting timmeslots for provider {} fromDate {}, toDate {} with error: {}", providerNo,
					fromDate, toDate, e.getMessage(), e);
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).header("Error Message", e.getMessage())
					.build();
		}
	}

	@GetMapping(path="/rx-orders-to-notify", produces = "application/json")
	public ResponseEntity<Iterable<FrameRxOrder>> getOrdersToNotify(@PathVariable("daysBack") int daysBack){
		return ResponseEntity.ok().body(
				this.schedulerApiService.getRxOrdersToNotify(LocalDate.now().minusDays(daysBack)));
	}

	@PostMapping(path="/rx-order", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<FrameRxOrder>updateRxOrder(@RequestBody final FrameRxOrder order){
		return ResponseEntity.ok().body(
				this.schedulerApiService.updateRxOrder(order));
	}
}
