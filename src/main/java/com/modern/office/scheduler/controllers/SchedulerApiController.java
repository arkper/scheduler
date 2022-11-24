package com.modern.office.scheduler.controllers;

import java.time.LocalDate;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.modern.office.scheduler.domain.Appointment;
import com.modern.office.scheduler.domain.Insurance;
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

	@GetMapping(path = "/services", produces = "application/json")
	public ResponseEntity<Iterable<Product>> getProducts()
	{
		return ResponseEntity.ok().body(this.schedulerApiService.getProducts());
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
}
