package com.modern.office.sns;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;

import com.fasterxml.jackson.core.JsonProcessingException;
import org.assertj.core.util.Lists;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.junit.jupiter.MockitoExtension;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.modern.office.config.AppConfig;
import com.modern.office.domain.Appointment;
import com.modern.office.domain.Business;
import com.modern.office.domain.Provider;
import com.modern.office.scheduler.services.SchedulerApiService;
import software.amazon.awssdk.core.SdkResponse;
import software.amazon.awssdk.http.SdkHttpResponse;
import software.amazon.awssdk.services.sns.SnsClient;
import software.amazon.awssdk.services.sns.model.CheckIfPhoneNumberIsOptedOutRequest;
import software.amazon.awssdk.services.sns.model.CheckIfPhoneNumberIsOptedOutResponse;
import software.amazon.awssdk.services.sns.model.PublishRequest;
import software.amazon.awssdk.services.sns.model.PublishResponse;
import software.amazon.awssdk.services.sqs.SqsClient;

import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class SnsServiceTest {
	
	@Mock
	private SchedulerApiService schedulerApiService;

	@Mock
	private SnsClient snsClient;

	@Mock
	private SqsClient sqsClient;

	@Mock
	private AppConfig appConfig;
	
	private SnsService testObj;
	
	@BeforeEach
	void setup() throws IOException {
		File blackListFile = File.createTempFile("blacklist", ".txt", new File(System.getProperty("java.io.tmpdir")));

		lenient().when(appConfig.getBlackListLocation()).thenReturn(blackListFile.getAbsolutePath());

		testObj = new SnsService(appConfig, schedulerApiService, new ObjectMapper(), snsClient, sqsClient);
	}

	@Test
	void testProcessReply() throws JsonProcessingException {
		final var message = "{\"messageBody\":\"Y\", \"originationNumber\":\"+13475551212\"}";
		final var sdkHttpResponse = SdkHttpResponse.builder().statusCode(200).build();
		SdkResponse response = PublishResponse.builder().messageId("12345").sdkHttpResponse(sdkHttpResponse).build();
		var checkIfPhoneNumberIsOptedOutResponse = CheckIfPhoneNumberIsOptedOutResponse
				.builder()
				.isOptedOut(false)
				.sdkHttpResponse(SdkHttpResponse.builder().statusCode(200).build())
				.build();

		when(this.schedulerApiService.getAppointmentToConfirm(0,0,1))
				.thenReturn(Lists.list(new Appointment().setApptPhone("(347) 555-1212")));

		when(this.snsClient.publish(Mockito.any(PublishRequest.class)))
				.thenReturn((PublishResponse) response);

		when(this.snsClient.checkIfPhoneNumberIsOptedOut(any(CheckIfPhoneNumberIsOptedOutRequest.class)))
				.thenReturn((CheckIfPhoneNumberIsOptedOutResponse) checkIfPhoneNumberIsOptedOutResponse);

		this.testObj.processReply(message);
	}

	@Test
	void phoneMatch() {
		Assertions.assertTrue(SnsService.matchPhone("347-222-3434", "+13472223434"));
		Assertions.assertTrue(SnsService.matchPhone("1 (347) 222 3434", "+13472223434"));
		Assertions.assertFalse(SnsService.matchPhone("10 (347) 222 3434", "+13472223434"));
	}
	
	@Disabled
	void testNotificationMessage()
	{
		var expected = "Please confirm your appointment on 8/21/23 at 13:30 with Diana Lakovitsky of Modern Optica at 453 Kings Hwy, Brooklyn. Reply Y to confirm or N to cancel. Reply STOP to opt out of our appointment notification messages going forward.\n\n" +
				"Пожалуйста, подтвердите ваш визит с доктором Diana Lakovitsky в офисе Modern Optica в 13:30 8/21/23 по адресу 453 Kings Hwy, Brooklyn. Введите Y чтобы подтвердить, или N чтобы отменить визит. Введите STOP чтобы больше не получать наших мобильных сообщений.";
		var appt = new Appointment()
				.setProviderNo(1)
				.setApptDate(LocalDate.of(2023, 8, 21))
				.setApptStartTime("13:30");
		
		when(schedulerApiService.getBusiness(Mockito.anyInt())).thenReturn(new Business()
				.setBusinessName("Modern Optica")
				.setAddress1("453 Kings Hwy")
				.setCity("Brooklyn"));
		when(schedulerApiService.getProviders()).thenReturn(Lists.list(new Provider()
				.setProviderNo(1).setProviderLastName("Lakovitsky").setProviderFirstName("Diana")));
		
		var message = testObj.getNotificationMessage(appt);
		
		Assertions.assertEquals(expected, message);
	}
}
