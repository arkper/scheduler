package com.modern.office.sns;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.modern.office.config.AppConfig;
import com.modern.office.domain.Appointment;
import com.modern.office.domain.Business;
import com.modern.office.domain.FrameRxOrder;
import com.modern.office.scheduler.services.SchedulerApiService;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.eclipse.collections.api.factory.Lists;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;
import software.amazon.awssdk.http.SdkHttpResponse;
import software.amazon.awssdk.services.sns.SnsClient;
import software.amazon.awssdk.services.sns.model.*;
import software.amazon.awssdk.services.sqs.SqsClient;
import software.amazon.awssdk.services.sqs.model.DeleteMessageRequest;
import software.amazon.awssdk.services.sqs.model.Message;
import software.amazon.awssdk.services.sqs.model.ReceiveMessageRequest;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.FormatStyle;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Objects;
import java.util.TreeMap;
import java.util.stream.StreamSupport;

@Service
@Slf4j
public class SnsService {
    private static final String NOTIFICATION_MESSAGE = "Please confirm your appointment on %s at %s with %s of %s at %s. Reply Y to confirm or N to cancel. Reply STOP to opt out of our appointment notification messages going forward.";

    private static final String NOTIFICATION_MESSAGE_RU = "Пожалуйста, подтвердите ваш визит с доктором %s в офисе %s в %s %s по адресу %s. Нажмите Y чтобы подтвердить, или N чтобы отменить визит. Введите STOP чтобы больше не получать наших мобильных сообщений.";

    private static final String RX_NOTIFICATION_MESSAGE = "Your prescription eye glasses are ready for pickup. Please reply Y to acknowledge this notification and your readiness to take the delivery. Reply STOP to opt out of our appointment notification messages going forward.";
    private static final String RX_NOTIFICATION_MESSAGE_RU = "Ваши очки по рецепту готовы. Пожалуйста, ответьте Y, чтобы подтвердить это уведомление и вашу готовность получить очки. Нажмите Y чтобы подтвердить, или N чтобы отменить визит. Введите STOP чтобы больше не получать наших мобильных сообщений.";

    private static final String ACKNOWLEDGMENT_MESSAGE = "Thanks, your response has been accepted.";
    private static final String ACKNOWLEDGMENT_MESSAGE_RU = "Спасибо - мы вас услышали";

    private static final String NACK_MESSAGE = "Your response is invalid. Reply Y to confirm or N to cancel. Reply STOP to opt out of our appointment notification messages going forward.";
    private static final String NACK_MESSAGE_RU = "Ваш ответ не верен. Нажмите Y чтобы подтвердить, или N чтобы отменить визит. Введите STOP чтобы больше не получать наших мобильных сообщений.";


    private final SnsClient snsClient;
    private final SqsClient sqsClient;
    private final String topicIncoming;
    private final SchedulerApiService schedulerApiService;
    private final ObjectMapper objectMapper;
    private final AppConfig appConfig;

    private Map<String, Integer> tryCounter = new TreeMap<>();

    @Value("${aws.sqs.reply-queue-url}")
    private String replyQueueUrl;

    @Value("${scheduler.rx-notification-enabled}")
    private boolean rxNotificationEnabled;

    public SnsService(final AppConfig appConfig, final SchedulerApiService schedulerApiService, final ObjectMapper objectMapper, final SnsClient snsClient, SqsClient sqsClient) {
        this.topicIncoming = appConfig.getTopicIncoming();
        this.sqsClient = sqsClient;
        log.info("Incoming SNS topic {}", this.topicIncoming);

        this.schedulerApiService = schedulerApiService;
        log.info("Enabled phone list: {}", appConfig.getAllowedPhones());
        this.objectMapper = objectMapper;
        this.appConfig = appConfig;
        this.snsClient = snsClient;
    }

    protected static boolean matchPhone(String apptPhone, String replyPhone) {
        return replyPhone.replaceAll("[^0-9]", "").contains(apptPhone.replaceAll("[^0-9]", ""));
    }

    @Scheduled(cron = "0 0 10 * * *", zone = "America/New_York")
    public void processNotifications() {
        log.info("Starting notification processing jobs");
        Lists.mutable.withAll(this.schedulerApiService.getAppointmentToConfirm(0, 0, 0))
                .select(it -> Objects.nonNull(it.getApptPhone()))
                .forEach(it -> this.processNotification(getNotificationMessage(it), it));

        log.info("Finished notification processing job");

        if (rxNotificationEnabled) {
            Lists.mutable.withAll(this.schedulerApiService.getRxOrdersToNotify(LocalDate.now().minusDays(3)))
                    .forEach(this::processRxNotification);

            log.info("Finished RX notification processing job");
        }
    }

    public void processRxNotification(FrameRxOrder rx) {
        var phone = this.transform(rx.getPhone());
        if ("EN".equals(this.getLang(rx.getPatientId()))) {
            this.sendSMS(RX_NOTIFICATION_MESSAGE, phone);
        } else {
            this.sendSMS(RX_NOTIFICATION_MESSAGE_RU, phone);
        }
        log.info("Updating RX order {}", rx.getRxId());
        this.schedulerApiService.updateRxOrder(rx);
    }

    public void processNotification(String message, Appointment appt) {
        if (Objects.isNull(appt.getApptPhone()) || appt.getApptPhone().length() < 10) {
            log.error("Appointment {} has invalid phone - skipping", appt.getApptNo());
            return;
        }
        var phone = this.transform(appt.getApptPhone());

        this.sendSMS(message, phone);
        this.schedulerApiService.setLeftMsgInd(appt.getApptNo(), 1);

        log.info("Updating appointment {} no-answer-indicator to 1", appt.getApptNo());
    }

    public SdkHttpResponse optInPhone(final String phoneNumber) {
        OptInPhoneNumberResponse response = this.snsClient.optInPhoneNumber(OptInPhoneNumberRequest.builder().phoneNumber(phoneNumber).build());

        return response.sdkHttpResponse();
    }

    public boolean isPhoneOptedOut(final String phoneNumber) {
        var response = this.snsClient.checkIfPhoneNumberIsOptedOut(CheckIfPhoneNumberIsOptedOutRequest.builder().phoneNumber(phoneNumber).build());

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

            log.info("Sending notification message {} to {}", message, transformed);

            PublishRequest request = PublishRequest.builder().message(message).phoneNumber(transformed).build();

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
            SubscribeRequest request = SubscribeRequest.builder().protocol("http").endpoint(url).returnSubscriptionArn(true).topicArn(this.topicIncoming).build();

            SubscribeResponse result = this.snsClient.subscribe(request);
            log.info("Subscription ARN is " + result.subscriptionArn() + ". Status is " + result.sdkHttpResponse().statusCode());
            return result.subscriptionArn();

        } catch (SnsException e) {
            log.error(e.awsErrorDetails().errorMessage());
            return null;
        }
    }

    @Scheduled(cron = "0 * 10-14 * * *")
    public void getReplies() {
        log.info("Running scheduled job to process inbound reply messages from queue sns-reply-queue");
        if (StringUtils.isEmpty(this.replyQueueUrl)) {
            log.info("Processing from queue sns-reply-queue is disabled - exiting");
            return;
        }

        var req = ReceiveMessageRequest
                .builder()
                .queueUrl(this.replyQueueUrl)
                .waitTimeSeconds(10)
                .maxNumberOfMessages(10)
                .build();

        var receiveMessageResponse = this.sqsClient.receiveMessage(req);
        receiveMessageResponse.messages().forEach(this::processReply);
    }

    public void processReply(final Message replyMessage) {
        @SuppressWarnings("rawtypes") LinkedHashMap data = null;
        try {
            data = this.objectMapper.readValue(replyMessage.body(), LinkedHashMap.class);
        } catch (JsonProcessingException e) {
            log.error("Un-parsable message received", e);
            this.deleteMessage(replyMessage, null);
            return;
        }

        if (data.containsKey("SubscribeURL")) {
            log.info("Please visit url {}", data.get("SubscribeURL"));
            this.deleteMessage(replyMessage, null);
            return;
        }

        final var message = (String) data.get("messageBody");
        final var phoneNumber = (String) data.get("originationNumber");

        if (this.tryCounter.getOrDefault(phoneNumber, 0) >= 3) {
            log.warn("Message {} has exceeded max retry count - deleting", replyMessage);
            this.deleteMessage(replyMessage, phoneNumber);
            return;
        }

        log.info("Updating appointment for phone {} with reply {}", phoneNumber, message);
        try {
            var appointment = StreamSupport.stream(this.schedulerApiService.getAppointmentToConfirm(0, 0, 1).spliterator(), false)
                    .filter(a -> matchPhone(a.getApptPhone(), phoneNumber)).findAny();

            if (appointment.isPresent()) {
                this.updateAppointment(appointment.get(), message, phoneNumber);
                this.deleteMessage(replyMessage, phoneNumber);
            } else {
                log.error("Unable locate the appointment for message {}", data);
                this.incrementAttemptCount(phoneNumber);
            }
        } catch (Exception e) {
            log.error("Failed processing message reply {}", data);
            this.incrementAttemptCount(phoneNumber);
        }
    }

    private void deleteMessage(Message message, String phone) {
        this.sqsClient.deleteMessage(DeleteMessageRequest
                .builder()
                .queueUrl(this.replyQueueUrl)
                .receiptHandle(message.receiptHandle())
                .build());

        if (Objects.nonNull(phone)) {
            this.tryCounter.remove(phone);
        }
    }

    /**
     * @param replyMessage
     * @throws JsonProcessingException
     * @deprecated - remove after completing testing of SQS messaging
     */
    @Deprecated
    public void processReply(final String replyMessage) throws JsonProcessingException {
        if (!StringUtils.isEmpty(this.replyQueueUrl)) {
            return;
        }

        @SuppressWarnings("rawtypes") LinkedHashMap data = this.objectMapper.readValue(replyMessage, LinkedHashMap.class);

        if (data.containsKey("SubscribeURL")) {
            log.info("Please visit url {}", data.get("SubscribeURL"));
            return;
        }

        final var message = (String) data.get("messageBody");
        final var phoneNumber = (String) data.get("originationNumber");
        log.info("Updating appointment for phone {} with reply {}", phoneNumber, message);
        var appointment = StreamSupport.stream(this.schedulerApiService.getAppointmentToConfirm(0, 0, 1).spliterator(), false)
                .filter(a -> matchPhone(a.getApptPhone(), phoneNumber)).findAny();

        if (appointment.isPresent()) {
            this.updateAppointment(appointment.get(), message, phoneNumber);
            this.tryCounter.remove(phoneNumber);
        } else {
            this.incrementAttemptCount(phoneNumber);
        }
    }

    private void incrementAttemptCount(String phoneNumber) {
        var currentCount = this.tryCounter.getOrDefault(phoneNumber, 0);
        this.tryCounter.put(phoneNumber, ++currentCount);
    }

    private void updateAppointment(Appointment appointment, String message, String phoneNumber) {
        var lang = this.getLang(appointment);
        switch (message.toUpperCase()) {
            case "Y", "YES", "ДА", "DA", "OK" -> this.schedulerApiService.confirm(appointment.getApptNo());
            case "STOP", "N", "NO", "НЕТ", "NET" -> this.schedulerApiService.cancel(appointment.getApptNo());
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
            return String.format(NOTIFICATION_MESSAGE, appt.getApptDate().format(DateTimeFormatter.ofLocalizedDate(FormatStyle.SHORT)), appt.getApptStartTime(), this.getProviderName(appt.getProviderNo()), this.appConfig.getOfficeName(), this.getAddress(business));
        } else {
            return String.format(NOTIFICATION_MESSAGE_RU, this.getProviderName(appt.getProviderNo()), this.appConfig.getOfficeName(), appt.getApptStartTime(), appt.getApptDate().format(DateTimeFormatter.ofLocalizedDate(FormatStyle.SHORT)), this.getAddress(business));
        }
    }

    private String getAddress(Business business) {
        return business.getAddress1() + ", " + business.getCity();
    }

    public String getProviderName(int providerNo) {
        return this.schedulerApiService.getAllProviders().stream().filter(p -> p.getProviderNo() == providerNo).findFirst().map(p -> p.getProviderFirstName() + " " + p.getProviderLastName()).orElse("");
    }

    public String transform(String originalPhone) {
        var phone = originalPhone.replaceAll("[^0-9]", "");
        return phone.startsWith("1") ? phone : "1" + phone;
    }

    public String addCountryCode(String originalPhone) {
        return originalPhone.startsWith("+") ? originalPhone : "+" + originalPhone;
    }

    private String getLang(Appointment appt) {
        return this.getLang(appt.getPatientNo());
    }

    private String getLang(int patientNo) {
        var lang = "EN";

        var patientPrefs = this.schedulerApiService.getPatientPreferences(patientNo);

        if (!CollectionUtils.isEmpty(patientPrefs)) {
            lang = patientPrefs.get(0).getLanguage();
        }
        return lang;
    }
}
