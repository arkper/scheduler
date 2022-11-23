package com.modern.office.scheduler.services;

import java.time.LocalDate;

import org.springframework.stereotype.Service;

import com.modern.office.scheduler.domain.Appointment;
import com.modern.office.scheduler.domain.Insurance;
import com.modern.office.scheduler.domain.Provider;
import com.modern.office.scheduler.domain.ProviderBlock;
import com.modern.office.scheduler.repository.AppointmentRepository;
import com.modern.office.scheduler.repository.InsuranceRepository;
import com.modern.office.scheduler.repository.ProviderBlockRepository;
import com.modern.office.scheduler.repository.ProviderRepository;

@Service
public class SchedulerApiServiceImpl implements SchedulerApiService {
	private final ProviderRepository providerRepo;
	private final InsuranceRepository insuranceRepo;
	private final ProviderBlockRepository providerBlockRepo;
	private final AppointmentRepository appointmentRepo;
	
	public SchedulerApiServiceImpl(final ProviderRepository providerRepo,
			final InsuranceRepository insuranceRepo,
			final ProviderBlockRepository providerBlockRepo,
			final AppointmentRepository appointmentRepo)
	{
		this.providerRepo = providerRepo;
		this.insuranceRepo = insuranceRepo;
		this.providerBlockRepo = providerBlockRepo;
		this.appointmentRepo = appointmentRepo;
	}

	public Iterable<Provider> getProviders() {
		return this.providerRepo.findAll();
	}

	public Iterable<Insurance> getInsurances() {
		return this.insuranceRepo.findAll();
	}

	public Iterable<ProviderBlock> getByProviderNo(int providerNo) {
		return this.providerBlockRepo.findAllByProviderNo(providerNo);
	}

	public Iterable<Appointment> getAppointmentByApptDateBetween(LocalDate startDate, LocalDate endDate) {
		return this.appointmentRepo.getAppointmentByApptDateBetween(startDate, endDate);
	}

	public Appointment save(Appointment appointment) {
		return this.appointmentRepo.save(appointment);
	}

	public Iterable<Appointment> getAppointmentByProviderNoAndApptDateBetween(
			int providerNo, 
			LocalDate startDate,
			LocalDate endDate) {
		return appointmentRepo.getAppointmentByProviderNoAndApptDateBetween(providerNo, startDate, endDate);
	}

	public Provider save(Provider provider) {
		return this.providerRepo.save(provider);
	}

	public Insurance save(Insurance insurance) {
		return this.insuranceRepo.save(insurance);
	}

	public ProviderBlock save(ProviderBlock providerBlock) {
		return this.providerBlockRepo.save(providerBlock);
	}

}
