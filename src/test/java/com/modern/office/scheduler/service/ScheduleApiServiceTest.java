package com.modern.office.scheduler.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import com.modern.office.repository.*;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import com.modern.office.config.AppConfig;
import com.modern.office.domain.Appointment;
import com.modern.office.domain.ProviderBlock;
import com.modern.office.domain.ProviderException;
import com.modern.office.domain.Timeslot;
import com.modern.office.scheduler.services.SchedulerApiService;
import com.modern.office.scheduler.services.SchedulerApiServiceImpl;

import static org.mockito.Mockito.lenient;

@ExtendWith(MockitoExtension.class)
public class ScheduleApiServiceTest {

	@Mock
	private ProviderBlockRepository providerBlockRepo;

	@Mock
	private ProviderExceptionRepository providerExceptionRepo;

	@Mock
	private AppointmentRepository appointmentRepo;
	@Mock
	private FrameRxRepository frameRxRepository;

	@Mock
	private PaymentComissionRepository paymentComissionRepository;

	@Mock
	private AppConfig appConfig;

	private SchedulerApiService testObj;

	@BeforeEach
	void setup() {
		lenient().when(appConfig.getInsurances()).thenReturn(new ArrayList<String>());
		lenient().when(appConfig.getProviders()).thenReturn(new ArrayList<Integer>());

		this.testObj = new SchedulerApiServiceImpl(null, null, providerBlockRepo, providerExceptionRepo,
				appointmentRepo, null, null, null, null, null, null,
				null, null, frameRxRepository, paymentComissionRepository, appConfig);
	}
	
	@Test
	void testGettingTimsSlotsNoExceptions() {

		Mockito.when(providerBlockRepo.findAllByProviderNo(1)).thenReturn(Stream.of(
				new ProviderBlock().setProviderNo(1).setDayOfWeek(1).setStartDateTime("09:00").setEndDateTime("17:00").setBlockType(1))
				.collect(Collectors.toList()));

		Set<Timeslot> timeslots = this.testObj.getTimeslots(1, LocalDate.of(2022, 11, 20), LocalDate.of(2022, 11, 25));

		Assertions.assertEquals(32, timeslots.size());
	}

	@Test
	void testGettingTimeSlotsTwoExceptionsAndAppointment() {

		Mockito.when(providerBlockRepo.findAllByProviderNo(1)).thenReturn(Stream.of(
				new ProviderBlock().setProviderNo(1).setDayOfWeek(1).setStartDateTime("09:00").setEndDateTime("18:00").setBlockType(1).setRangeNo(2),
				new ProviderBlock().setProviderNo(1).setDayOfWeek(1).setStartDateTime("09:00").setEndDateTime("17:00").setBlockType(1),
				new ProviderBlock().setProviderNo(1).setDayOfWeek(1).setStartDateTime("09:00").setEndDateTime("10:00").setBlockType(1),
				new ProviderBlock().setProviderNo(1).setDayOfWeek(2).setStartDateTime("10:00").setEndDateTime("16:00").setBlockType(1))
				.collect(Collectors.toList()));

		Mockito.when(providerExceptionRepo.getProviderExceptionsByProviderNo(1))
				.thenReturn(Stream.of(
						new ProviderException().setProviderNo(1).setExceptionDate(LocalDate.of(2022, 11, 22))
								.setStartTime("10:00").setEndTime("15:00"),
						new ProviderException().setProviderNo(1).setExceptionDate(LocalDate.of(2022, 11, 21))
								.setStartTime("13:00").setEndTime("14:00"))
						.collect(Collectors.toList()));

		Mockito.when(appointmentRepo.getAppointmentByProviderNoAndApptDateBetween(1, LocalDate.of(2022, 11, 20),
				LocalDate.of(2022, 11, 25)))
				.thenReturn(Stream.of(
						new Appointment().setApptDate(LocalDate.of(2022, 11, 21)).setApptStartTime("09:15")
								.setApptEndTime("09:30"),
						new Appointment().setApptDate(LocalDate.of(2022, 11, 21)).setApptStartTime("15:00")
								.setApptEndTime("15:30"))
						.collect(Collectors.toList()));

		Set<Timeslot> timeslots = this.testObj.getTimeslots(1, LocalDate.of(2022, 11, 20), LocalDate.of(2022, 11, 25));

		Assertions.assertEquals(30, timeslots.size());
	}
}
