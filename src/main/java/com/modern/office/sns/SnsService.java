package com.modern.office.sns;

import java.io.IOException;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.LinkedHashMap;
import java.util.TreeSet;
import java.util.stream.StreamSupport;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.modern.office.scheduler.AppConfig;
import com.modern.office.scheduler.domain.Appointment;
import com.modern.office.scheduler.domain.Business;
import com.modern.office.scheduler.services.SchedulerApiService;

import lombok.extern.slf4j.Slf4j;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.sns.SnsClient;
import software.amazon.awssdk.services.sns.model.OptInPhoneNumberRequest;
import software.amazon.awssdk.services.sns.model.OptInPhoneNumberResponse;
import software.amazon.awssdk.services.sns.model.PublishRequest;
import software.amazon.awssdk.services.sns.model.PublishResponse;
import software.amazon.awssdk.services.sns.model.SnsException;
import software.amazon.awssdk.services.sns.model.SubscribeRequest;
import software.amazon.awssdk.services.sns.model.SubscribeResponse;

@Service
@Slf4j
public class SnsService {
	private static final String NOTIFICATION_MESSAGE = "Please confirm your appointment on %s at %s with %s of %s at %s. Reply Y to confirm or N to cancel. Reply STOP to opt out of our appointment notification messages going forward.";
	
	private static final String NOTIFICATION_MESSAGE_RU = "Пожалуйста, подтвердите ваш визит с доктором %s в офисе %s в %s %s по адресу %s. Введите Y чтобы подтвердить, или N чтобы отменить визит. Введите STOP чтобы больше не получать наших мобильных сообщений.";

	private static final String ACKNOWLEDGMENT_MESSAGE = "Thanks, your response has been accepted.";
	
	private final SnsClient snsClient;
	private final String topicIncoming;
	private final SchedulerApiService schedulerApiService;
	private final ObjectMapper objectMapper;
	private AppConfig appConfig;
	
	public SnsService(final AppConfig appConfig,
			final SchedulerApiService schedulerApiService,
			final ObjectMapper objectMapper)
	{
		AwsBasicCredentials awsCreds = AwsBasicCredentials.create(
				appConfig.getAccessKey(), 
				appConfig.getAccessSecret());
		
        this.snsClient = SnsClient.builder()
                .region(Region.US_EAST_1)
                .credentialsProvider(StaticCredentialsProvider.create(awsCreds))
                .build();
        log.info("Initialized SNS client");
        this.topicIncoming = appConfig.getTopicIncoming();
        log.info("Incoming SNS topic {}", this.topicIncoming);
        
        this.schedulerApiService = schedulerApiService;
        log.info("Enabled phone list: {}", appConfig.getAllowedPhones());
        this.objectMapper = objectMapper;
        this.appConfig = appConfig;
	}
	
	@Scheduled(cron = "0 0 10 * * *", zone = "America/New_York")
	public void processNotifications()
	{
		log.info("Starting notification processing job");
		StreamSupport.<Appointment>stream(this.schedulerApiService.getAppointmentToConfirm(0, 0, 0).spliterator(), false)
		    .filter(appt -> appt.getApptPhone() != null)
		    .forEach(appt -> this.processNotification(getNotificationMessage(appt), appt));
		log.info("Finished notification processing job");
	}
	
	public String processNotification(String message, Appointment appt)
	{
		var phone = this.transform(appt.getApptPhone());
        if (!this.phoneEnabled(phone))
    	{
        	log.info("Phone {} is not enabled for SMS service", appt.getApptPhone());
        	return "";
    	}

        final var result = this.sendSMS(message, phone);
        this.schedulerApiService.setLeftMsgInd(appt.getApptNo(), 1);

        log.info("Updating appointment {} no-answer-indicator to 1", appt.getApptNo());
        return result;
	}
	
	public String optInPhone(final String phoneNumber)
	{
		OptInPhoneNumberResponse response = 
				this.snsClient.optInPhoneNumber(OptInPhoneNumberRequest.builder().phoneNumber(phoneNumber).build());
		
		return response.toString();
	}

    public String sendSMS(String message, String phone) {
        try {
        	log.info("Sending message {} to {}", message, phone);
        	
            PublishRequest request = (PublishRequest) PublishRequest.builder()
                .message(message)
                .phoneNumber(phone)
                .build();

            PublishResponse result = this.snsClient.publish(request);
            log.info(result.messageId() + " Message sent. Status is " + result.sdkHttpResponse().statusCode());
            return result.messageId();

        } catch (SnsException e) {
            log.error(e.awsErrorDetails().errorMessage(), e);
            return null;
        }
    }
    
    public String subscribe(final String url) {

        try {
            SubscribeRequest request = SubscribeRequest.builder()
                .protocol("http")
                .endpoint(url)
                .returnSubscriptionArn(true)
                .topicArn(this.topicIncoming)
                .build();

            SubscribeResponse result = this.snsClient.subscribe(request);
            log.info("Subscription ARN is " + result.subscriptionArn() + ". Status is " + result.sdkHttpResponse().statusCode());
            return result.subscriptionArn();

        } catch (SnsException e) {
            log.error(e.awsErrorDetails().errorMessage());
            return null;
         }
    }
    
    public void processReply(final String replyMessage) throws JsonMappingException, JsonProcessingException
    {
        LinkedHashMap data = this.objectMapper.readValue(replyMessage, LinkedHashMap.class);
        
        if (data.containsKey("SubscribeURL"))
        {
        	log.info("Please visit url {}", (String) data.get("SubscribeURL"));
        	return;
        }
        
        String message = (String) data.get("messageBody");
        String phoneNumber = (String) data.get("originationNumber");
        log.info("Updating appointment for phone {} with reply {}", phoneNumber, message);
        if (this.phoneEnabled(phoneNumber))
        {
        	StreamSupport.stream(this.schedulerApiService.getAppointmentToConfirm(0, 0, 1).spliterator(), false)
    	    .filter(a -> matchPhone(a.getApptPhone(), phoneNumber))
    	    .findAny()
    	    .ifPresent(appointment -> this.updateAppointment(appointment, message, phoneNumber));
        }
    }
    
    private boolean phoneEnabled(String phone)
    {
    	phone = phone.replaceAll("[^0-9]", "");
    	var blackList = new TreeSet<String>();
    	try {
			blackList.addAll(Files.readAllLines(Paths.get(URI.create("file:///" + this.appConfig.getBlackListLocation()))));
		} catch (IOException e) {
			log.error("Failed getting blacklist {}", this.appConfig.getBlackListLocation(), e);
			throw new RuntimeException(e);
		}
    	if ((CollectionUtils.isEmpty(this.appConfig.getAllowedPhones()) || this.appConfig.getAllowedPhones().contains(phone)) && !blackList.contains(phone))
    	{
    		log.info("Phone {} is enabled", phone);
    		return true;
    	}
    	
		log.info("Phone {} is not enabled", phone);
    	return false;
    }
    
    protected static boolean matchPhone(String apptPhone, String replyPhone)
    {
    	return replyPhone.replaceAll("[^0-9]", "").contains(apptPhone.replaceAll("[^0-9]", ""));
    }
    
    private void updateAppointment(Appointment appointment, String message, String phoneNumber)
    {
    	if ("Y".equalsIgnoreCase(message))
    	{
    		this.schedulerApiService.confirm(appointment.getApptNo());
    	}
    	else if ("STOP".equalsIgnoreCase(message))
    	{
    		this.blackListPhone(phoneNumber);
    	}
    	else
    	{
            this.schedulerApiService.cancel(appointment.getApptNo());
    	}
    	
    	this.sendSMS(ACKNOWLEDGMENT_MESSAGE, appointment.getApptPhone());
    }
    
	protected String getNotificationMessage(Appointment appt) {
		var business = this.schedulerApiService.getBusiness(1);
		
		return String.format(NOTIFICATION_MESSAGE, 
				appt.getApptDate().format(DateTimeFormatter.ofLocalizedDate(FormatStyle.SHORT)), 
				appt.getApptStartTime(), 
				this.getProviderName(appt.getProviderNo()),
				business.getBusinessName(),
				this.getAddress(business)) +
				"\n\n" +
				String.format(NOTIFICATION_MESSAGE_RU,
				this.getProviderName(appt.getProviderNo()),
				business.getBusinessName(),
				appt.getApptStartTime(),
				appt.getApptDate().format(DateTimeFormatter.ofLocalizedDate(FormatStyle.SHORT)),
				this.getAddress(business));
	}
	
	private String getAddress(Business business)
	{		
	    return business.getAddress1() + ", " + business.getCity();
	}
	
    private String getProviderName(int providerNo)
    {
    	return this.schedulerApiService.getProviders().stream().filter(p -> p.getProviderNo() == providerNo).findFirst()
    			.map(p -> p.getProviderFirstName() + " " + p.getProviderLastName())
    			.orElse("");
    }
    
    private void blackListPhone(String phone)
    {
    	 try {
			Files.write(
				      Paths.get(this.appConfig.getBlackListLocation()), 
				      this.transform(phone).getBytes(), 
				      StandardOpenOption.APPEND);
		} catch (IOException e) {
			log.error("Failed to blacklist phone {}", phone);
			throw new RuntimeException(e);
		}
    }
    
    private String transform(String originalPhone)
    {
    	var phone = originalPhone.replaceAll("[^0-9]", "");
    	return phone.startsWith("1") ? phone : "1" + phone;
    }
}
