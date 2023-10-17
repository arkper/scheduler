package com.modern.office.sns;

import java.io.IOException;
import java.net.URI;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.LinkedHashMap;
import java.util.Objects;
import java.util.Set;
import java.util.TreeSet;
import java.util.stream.StreamSupport;

import com.modern.office.scheduler.domain.Patient;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.modern.office.scheduler.AppConfig;
import com.modern.office.scheduler.domain.Appointment;
import com.modern.office.scheduler.domain.Business;
import com.modern.office.scheduler.services.SchedulerApiService;

import lombok.extern.slf4j.Slf4j;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.http.SdkHttpResponse;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.sns.SnsClient;
import software.amazon.awssdk.services.sns.model.*;

@Service
@Slf4j
public class SnsService {
    private static final String NOTIFICATION_MESSAGE = "Please confirm your appointment on %s at %s with %s of %s at %s. Reply Y to confirm or N to cancel. Reply STOP to opt out of our appointment notification messages going forward.";

    private static final String NOTIFICATION_MESSAGE_RU = "Пожалуйста, подтвердите ваш визит с доктором %s в офисе %s в %s %s по адресу %s. Нажмите Y чтобы подтвердить, или N чтобы отменить визит. Введите STOP чтобы больше не получать наших мобильных сообщений.";

    private static final String ACKNOWLEDGMENT_MESSAGE = "Thanks, your response has been accepted.";
    private static final String ACKNOWLEDGMENT_MESSAGE_RU = "Спасибо - мы вас услышали";

    private static final String NACK_MESSAGE = "Your reponse is invalid. Reply Y to confirm or N to cancel. Reply STOP to opt out of our appointment notification messages going forward.";
    private static final String NACK_MESSAGE_RU = "Ваш ответ не верен. Нажмите Y чтобы подтвердить, или N чтобы отменить визит. Введите STOP чтобы больше не получать наших мобильных сообщений.";


    private final SnsClient snsClient;
    private final String topicIncoming;
    private final SchedulerApiService schedulerApiService;
    private final ObjectMapper objectMapper;
    private final AppConfig appConfig;

    public SnsService(final AppConfig appConfig,
                      final SchedulerApiService schedulerApiService,
                      final ObjectMapper objectMapper,
                      final SnsClient snsClient) {
        this.topicIncoming = appConfig.getTopicIncoming();
        log.info("Incoming SNS topic {}", this.topicIncoming);

        this.schedulerApiService = schedulerApiService;
        log.info("Enabled phone list: {}", appConfig.getAllowedPhones());
        this.objectMapper = objectMapper;
        this.appConfig = appConfig;
        this.snsClient = snsClient;
    }

    @Scheduled(cron = "0 0 10 * * *", zone = "America/New_York")
    public void processNotifications() {
        log.info("Starting notification processing job");
        StreamSupport.stream(this.schedulerApiService.getAppointmentToConfirm(0, 0, 0).spliterator(), false)
                .filter(appt -> appt.getApptPhone() != null)
                .forEach(appt -> this.processNotification(getNotificationMessage(appt), appt));
        log.info("Finished notification processing job");
    }

    public void processNotification(String message, Appointment appt) {
        if (Objects.isNull(appt.getApptPhone()) || appt.getApptPhone().length() < 10)
        {
            log.error ("Appointment {} has invalid phone - skipping", appt.getApptNo());
            return;
        }
        var phone = this.transform(appt.getApptPhone());
        if (!this.phoneEnabled(phone)) {
            return;
        }

        this.sendSMS(message, phone);
        this.schedulerApiService.setLeftMsgInd(appt.getApptNo(), 1);

        log.info("Updating appointment {} no-answer-indicator to 1", appt.getApptNo());
    }

    public SdkHttpResponse optInPhone(final String phoneNumber) {
        OptInPhoneNumberResponse response =
                this.snsClient.optInPhoneNumber(OptInPhoneNumberRequest.builder().phoneNumber(phoneNumber).build());

        return response.sdkHttpResponse();
    }

    public boolean isPhoneOptedOut(final String phoneNumber) {
        var response = this.snsClient.checkIfPhoneNumberIsOptedOut
                (CheckIfPhoneNumberIsOptedOutRequest.builder().phoneNumber(phoneNumber).build());

        return response.sdkHttpResponse().isSuccessful() && response.isOptedOut();
    }

    public String sendSMS(String message, String phone) {
        try {
            log.info("Original phone {}", phone);

            var transformed = this.addCountryCode(this.transform(phone));

            if (this.isPhoneOptedOut(transformed)) {
                log.info("The phone {} opted out of SMS notifications - exiting", transformed);
                return "Opted Out";
            }

            log.info("Sending notification message to {}", transformed);

            PublishRequest request = PublishRequest.builder()
                    .message(message)
                    .phoneNumber(transformed)
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

    public void processReply(final String replyMessage) throws JsonProcessingException {
        @SuppressWarnings("rawtypes")
        LinkedHashMap data = this.objectMapper.readValue(replyMessage, LinkedHashMap.class);

        if (data.containsKey("SubscribeURL")) {
            log.info("Please visit url {}", data.get("SubscribeURL"));
            return;
        }

        final var message = (String) data.get("messageBody");
        final var phoneNumber = (String) data.get("originationNumber");
        log.info("Updating appointment for phone {} with reply {}", phoneNumber, message);
        if (this.phoneEnabled(phoneNumber)) {
            StreamSupport.stream(this.schedulerApiService.getAppointmentToConfirm(0, 0, 1).spliterator(), false)
                    .filter(a -> matchPhone(a.getApptPhone(), phoneNumber))
                    .findAny()
                    .ifPresent(appointment -> this.updateAppointment(appointment, message, phoneNumber));
        }
    }

    private boolean phoneEnabled(String phone) {
        phone = phone.replaceAll("[^0-9]", "");
        Set<String> blackList;
        try {
            blackList = new TreeSet<>(Files.readAllLines(Paths.get(URI.create("file:///" + this.appConfig.getBlackListLocation()))));
        } catch (IOException e) {
            log.error("Failed getting blacklist {}", this.appConfig.getBlackListLocation(), e);
            throw new RuntimeException(e);
        }
        if ((CollectionUtils.isEmpty(this.appConfig.getAllowedPhones()) || this.appConfig.getAllowedPhones().contains(phone)) && !blackList.contains(phone)) {
            log.debug("Phone {} is enabled", phone);
            return true;
        }

        log.info("Phone {} is not enabled", phone);
        return false;
    }

    protected static boolean matchPhone(String apptPhone, String replyPhone) {
        return replyPhone.replaceAll("[^0-9]", "").contains(apptPhone.replaceAll("[^0-9]", ""));
    }

    private void updateAppointment(Appointment appointment, String message, String phoneNumber) {
        var lang = this.getLang(appointment);
        switch (message.toUpperCase()) {
            case "Y", "YES", "ДА", "DA", "OK" -> this.schedulerApiService.confirm(appointment.getApptNo());
            case "STOP" -> this.blackListPhone(phoneNumber);
            case "N", "NO", "НЕТ", "NET" -> this.schedulerApiService.cancel(appointment.getApptNo());
            default -> {
                if ("EN".equals(lang)) {
                    this.sendSMS(NACK_MESSAGE, phoneNumber);
                } else {
                    this.sendSMS(NACK_MESSAGE_RU, phoneNumber);
                }
                return;
            }
        }

        if ("EN".equals(lang)) {
            this.sendSMS(ACKNOWLEDGMENT_MESSAGE, phoneNumber);
        } else {
            this.sendSMS(ACKNOWLEDGMENT_MESSAGE_RU, phoneNumber);
        }
    }

    protected String getNotificationMessage(Appointment appt) {
        var business = this.schedulerApiService.getBusiness(1);

        if ("EN".equals(this.getLang(appt))) {
            return String.format(NOTIFICATION_MESSAGE,
                    appt.getApptDate().format(DateTimeFormatter.ofLocalizedDate(FormatStyle.SHORT)),
                    appt.getApptStartTime(),
                    this.getProviderName(appt.getProviderNo()),
                    this.appConfig.getOfficeName(),
                    this.getAddress(business));
        } else {
            return String.format(NOTIFICATION_MESSAGE_RU,
                    this.getProviderName(appt.getProviderNo()),
                    this.appConfig.getOfficeName(),
                    appt.getApptStartTime(),
                    appt.getApptDate().format(DateTimeFormatter.ofLocalizedDate(FormatStyle.SHORT)),
                    this.getAddress(business));
        }
    }

    private String getAddress(Business business) {
        return business.getAddress1() + ", " + business.getCity();
    }

    private String getProviderName(int providerNo) {
        return this.schedulerApiService.getAllProviders().stream().filter(p -> p.getProviderNo() == providerNo).findFirst()
                .map(p -> p.getProviderFirstName() + " " + p.getProviderLastName())
                .orElse("");
    }

    private void blackListPhone(String phone) {
        try {
            Files.write(
                    Paths.get(this.appConfig.getBlackListLocation()),
                    this.transform(phone + "\n").getBytes(),
                    StandardOpenOption.APPEND);
        } catch (IOException e) {
            log.error("Failed to blacklist phone {}", phone);
            throw new RuntimeException(e);
        }
    }

    private String transform(String originalPhone) {
        var phone = originalPhone.replaceAll("[^0-9]", "");
        return phone.startsWith("1") ? phone : "1" + phone;
    }

    private String addCountryCode(String originalPhone) {
        return originalPhone.startsWith("+") ? originalPhone : "+" + originalPhone;
    }

    private String getLang(Appointment appt) {
        var lang = "EN";

        var patientPrefs = this.schedulerApiService.getPatientPreferences(appt.getPatientNo());

        if (!CollectionUtils.isEmpty(patientPrefs)) {
            lang = patientPrefs.get(0).getLanguage();
        }
        return lang;
    }
}
