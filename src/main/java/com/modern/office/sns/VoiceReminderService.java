package com.modern.office.sns;

import com.modern.office.scheduler.domain.Appointment;
import com.modern.office.scheduler.services.SchedulerApiService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.collections.keyvalue.DefaultMapEntry;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import software.amazon.awssdk.services.connect.ConnectClient;
import software.amazon.awssdk.services.connect.model.GetContactAttributesRequest;
import software.amazon.awssdk.services.connect.model.GetContactAttributesResponse;
import software.amazon.awssdk.services.connect.model.StartOutboundVoiceContactRequest;
import software.amazon.awssdk.services.connect.model.StartOutboundVoiceContactResponse;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.stream.StreamSupport;

@Service
@RequiredArgsConstructor
@Slf4j
public class VoiceReminderService {
    private static final Map<String, String> DICTIONARY = Map.ofEntries(
            new DefaultMapEntry("Lakovitsky", "Лаковицкой"),
            new DefaultMapEntry("Givner", "Гивнером"),
            new DefaultMapEntry("Modern Optikal", "Модерн Оптика"),
            new DefaultMapEntry("January", "Января"),
            new DefaultMapEntry("February", "Февраля"),
            new DefaultMapEntry("March", "Марта"),
            new DefaultMapEntry("April", "Апреля"),
            new DefaultMapEntry("May", "Мая"),
            new DefaultMapEntry("June", "Июня"),
            new DefaultMapEntry("July", "Июля"),
            new DefaultMapEntry("August", "Августа"),
            new DefaultMapEntry("September", "Сентября"),
            new DefaultMapEntry("October", "Октября"),
            new DefaultMapEntry("November", "Ноября"),
            new DefaultMapEntry("December", "Декабря"),
            new DefaultMapEntry("Optical Gallery", "Оптикал Гелери"),
            new DefaultMapEntry("Kings Highway", "Кингс Найвей")
    );

    private static final String MESSAGE_RU = "Пожалуйста, подтвердите ваш визит с доктором %s в офисе %s в %s %s по адресу %s. Нажмите 1 чтобы подтвердить, или 2 чтобы отменить визит. Нажмите 3 чтобы перенести ваш визит на другой день.";
    private static final String MESSAGE_EN = "Please confirm your appointment with Dr. %s at the office of %s at %s on %s at %s. Press 1 to confirm, 2 to cancel or 3 to reschedule";

    private static final String FINAL_PROMPT_RU = "Спасибо большое!";

    private static final String FINAL_PROMPT_EN = "Thank you very much!";

    private static final String LANGUAGE_SELECTION_RU = "Пожалуйста, нажмите 1 чтобы продолжить на русском или 2 для английского";

    private final SchedulerApiService schedulerApiService;
    private final ConnectClient connectClient;
    private final SnsService snsService;
    private final ConcurrentLinkedQueue<Notification> notificationQueue = new ConcurrentLinkedQueue<>();

    @Value("${aws.connect.instanceId}")
    private String instanceId;
    @Value("${aws.connect.queueId}")
    private String queueId;
    @Value("${aws.connect.contactFlowId}")
    private String contactFlowId;
    @Value("${office-forms.company}")
    private String company;
    @Value("${office-forms.company-address}")
    private String address;

    @Scheduled(cron = "0 0 14 * * *", zone = "America/New_York")
    public void processNotifications() {
        log.info("Starting notification processing job");
        StreamSupport.stream(this.schedulerApiService.getAppointmentToConfirm(0, 0, 1).spliterator(), false).filter(appt -> appt.getApptPhone() != null).forEach(appt -> this.processNotification(appt));
        log.info("Finished notification processing job");
    }

    private void processNotification(Appointment appt) {
        var promptRu = this.finalizePrompt(MESSAGE_RU, appt, true);
        var promptEn = this.finalizePrompt(MESSAGE_EN, appt, false);
        var phone = this.snsService.addCountryCode(this.snsService.transform(appt.getApptPhone()));

        var contactId = this.sendNotification(phone, new String[]{promptRu, promptEn});

        this.notificationQueue.add(new Notification(
                contactId,
                appt.getApptNo(),
                LocalDateTime.now().plusSeconds(45),
                LocalDateTime.now().plusMinutes(3)));
    }

    public String sendNotification(String phone, String[] messages) {
        Map<String, String> attributes = Map.of(
                "messageRu", messages[0],
                "messageEn", messages[1],
                "finalMessageRu", FINAL_PROMPT_RU,
                "finalMessageEn", FINAL_PROMPT_EN,
                "languageSelectionPrompt", LANGUAGE_SELECTION_RU);

        StartOutboundVoiceContactRequest request = StartOutboundVoiceContactRequest.builder()
                .instanceId(this.instanceId)
                .contactFlowId(this.contactFlowId)
                .queueId(this.queueId)
                .destinationPhoneNumber(phone)
                .attributes(attributes)
                .build();

        StartOutboundVoiceContactResponse response = this.connectClient.startOutboundVoiceContact(request);

        log.info("Received response from AWS Connect: {}", response.toString());

        return response.contactId();
    }

    private String finalizePrompt(String msgTemplate, Appointment appt, boolean translate) {
        var doctor = this.snsService.getProviderName(appt.getProviderNo());
        var date = appt.getApptDate().format(DateTimeFormatter.ofPattern("MMMMM,dd"));
        var month = date.split(",")[0];
        var day = date.split(",")[1];

        return String.format(msgTemplate,
                translate ? this.translate(doctor) : doctor,
                translate ? this.translate(this.company) : this.company,
                appt.getApptStartTime(),
                day + (translate ? " " + this.translate(month) : " of " + month),
                translate ? this.translate(this.address) : this.address);
    }

    private String translate(String source) {
        return DICTIONARY.getOrDefault(source, source);
    }

    @Scheduled(fixedDelay = 60000, initialDelay = 60000)
    public void pollResponses() {
        Notification notification;
        var batch = new ArrayList<Notification>();
        while ((notification = this.notificationQueue.poll() ) != null) {
            batch.add(notification);
        }
        log.info("Got {} notifications to get replies for", batch.size());
        batch.forEach(this::handleNotification);
    }

    private void handleNotification(Notification notification) {
        if (notification.dueTime.isAfter(LocalDateTime.now())) {
            log.info("Appointment {} is still not due for a response - enqueueing", notification.apptNo);
            this.notificationQueue.add(notification);
        } else if (notification.expirationTime.isBefore(LocalDateTime.now())) {
            log.info("Appointment {} is past due for a response - discarding", notification.apptNo);
            return;
        } else {
            log.info("Appointment {} is due for a response - polling AWS", notification.apptNo);
            int responseAttribute = this.getResponseAttribute(notification.contactId);
            log.info("Appointment {} received a response of {}", notification.apptNo, responseAttribute);
            if (responseAttribute == 0) {
                this.notificationQueue.add(notification);
            } else {
                switch (responseAttribute) {
                    case 1 -> this.schedulerApiService.confirm(notification.apptNo());
                    case 2 -> this.schedulerApiService.cancel(notification.apptNo());
                    default -> log.error("Invalid response received for apptNo {}", notification.apptNo);
                }
            }
        }
    }

    private int getResponseAttribute(String contactId) {
        GetContactAttributesRequest request = GetContactAttributesRequest
                .builder()
                .instanceId(this.instanceId)
                .initialContactId(contactId)
                .build();

        GetContactAttributesResponse contactAttributes = this.connectClient.getContactAttributes(request);

        return Integer.parseInt(
                contactAttributes.attributes().getOrDefault("customerInput", "0"));
    }

    public static record Notification(String contactId, int apptNo, LocalDateTime dueTime,
                                      LocalDateTime expirationTime) {
    }
}
