package com.modern.office.scheduler.services;

import java.time.LocalDate;

import com.modern.office.scheduler.domain.Appointment;
import com.modern.office.scheduler.domain.Insurance;
import com.modern.office.scheduler.domain.Provider;
import com.modern.office.scheduler.domain.ProviderBlock;

public interface SchedulerApiService {
	Iterable<Provider> getProviders();
	Provider save(Provider provider);
	Iterable<Insurance> getInsurances();
	Insurance save(Insurance insurance);
	Iterable<ProviderBlock> getByProviderNo(int providerNo);
	ProviderBlock save(ProviderBlock providerBlock);
	Iterable<Appointment> getAppointmentByApptDateBetween(LocalDate startDate, LocalDate endDate);
	Iterable<Appointment> getAppointmentByProviderNoAndApptDateBetween(int providerNo, LocalDate startDate, LocalDate endDate);
	Appointment save(Appointment appointment);
}
