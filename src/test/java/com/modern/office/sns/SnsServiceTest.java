package com.modern.office.sns;

import java.time.LocalDate;

import org.assertj.core.util.Lists;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.exceptions.base.MockitoException;
import org.mockito.junit.jupiter.MockitoExtension;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.modern.office.scheduler.AppConfig;
import com.modern.office.scheduler.domain.Appointment;
import com.modern.office.scheduler.domain.Business;
import com.modern.office.scheduler.domain.Provider;
import com.modern.office.scheduler.services.SchedulerApiService;

@ExtendWith(MockitoExtension.class)
public class SnsServiceTest {
	
	@Mock
	private SchedulerApiService schedulerApiService;
	
	@Mock
	private AppConfig appConfig;
	
	private SnsService testObj;
	
	@BeforeEach
	void setup()
	{
		Mockito.when(appConfig.getAccessKey()).thenReturn("x");
		Mockito.when(appConfig.getAccessSecret()).thenReturn("x");
		
		testObj = new SnsService(appConfig, schedulerApiService, new ObjectMapper());
		
	}

	@Test
	void phoneMatch() {
		Assertions.assertTrue(SnsService.matchPhone("347-222-3434", "+13472223434"));
		Assertions.assertTrue(SnsService.matchPhone("1 (347) 222 3434", "+13472223434"));
		Assertions.assertFalse(SnsService.matchPhone("10 (347) 222 3434", "+13472223434"));
	}
	
	@Test
	void testNotificationMessage()
	{
		var expected = "Please confirm your appointment on 8/21/23 at 13:30 with Diana Lakovitsky of Modern Optica at 453 Kings Hwy, Brooklyn. Reply Y to confirm or N to cancel.\n\n" +
				"Пожалуйста, подтвердите ваш визит с доктором Diana Lakovitsky в офисе Modern Optica в 13:30 8/21/23 по адресу 453 Kings Hwy, Brooklyn. Введите Y чтобы подтвердить, или N чтобы отменить визит.";
		var appt = new Appointment()
				.setProviderNo(1)
				.setApptDate(LocalDate.of(2023, 8, 21))
				.setApptStartTime("13:30");
		
		Mockito.when(schedulerApiService.getBusiness(Mockito.anyInt())).thenReturn(new Business()
				.setBusinessName("Modern Optica")
				.setAddress1("453 Kings Hwy")
				.setCity("Brooklyn"));
		Mockito.when(schedulerApiService.getProviders()).thenReturn(Lists.list(new Provider()
				.setProviderNo(1).setProviderLastName("Lakovitsky").setProviderFirstName("Diana")));
		
		var message = testObj.getNotificationMessage(appt);
		
		Assertions.assertEquals(expected, message);
	}



}
