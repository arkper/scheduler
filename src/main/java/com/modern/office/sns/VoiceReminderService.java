package com.modern.office.sns;

import com.modern.office.domain.Appointment;
import com.modern.office.scheduler.services.SchedulerApiService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.eclipse.collections.api.factory.Maps;
import org.eclipse.collections.api.tuple.Pair;
import org.eclipse.collections.impl.tuple.Tuples;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Profile;
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
@Profile("sns")
public class VoiceReminderService {
    private static final Map<String, Pair<String, String>> DICTIONARY = Maps.mutable.<String, Pair<String, String>>empty()
            .withKeyValue("Diana Lakovitsky", Tuples.pair("Дианой Лаковицкой", "Diana Lakovitsky"))
            .withKeyValue("Steven Givner", Tuples.pair("Стивеном Гивнером", "Steven Givner"))
            .withKeyValue("Modern Optical", Tuples.pair("Модерн Оптика", "Óptica Moderna"))
            .withKeyValue("Optical Gallery", Tuples.pair("Оптикал Гелери", "Galería Óptica"))
            .withKeyValue("January", Tuples.pair("Января", "de Enero"))
            .withKeyValue("February", Tuples.pair("Февраля", "de Febrero"))
            .withKeyValue("March", Tuples.pair("Марта", "de Marzo"))
            .withKeyValue("April", Tuples.pair("Апреля", "de Abril"))
            .withKeyValue("May", Tuples.pair("Мая", "de Puede"))
            .withKeyValue("June", Tuples.pair("Июня", "de Junio"))
            .withKeyValue("July", Tuples.pair("Июля", "de Julio"))
            .withKeyValue("August", Tuples.pair("Августа", "de Agosto"))
            .withKeyValue("September", Tuples.pair("Сентября", "de Septiembre"))
            .withKeyValue("October", Tuples.pair("Октября", "de Octubre"))
            .withKeyValue("November", Tuples.pair("November", "de Noviembre"))
            .withKeyValue("December", Tuples.pair("Декабря", "de Diciembre"))
            .withKeyValue("453 Kings Highway", Tuples.pair("353 Кингс Хайвей", ""))
            .withKeyValue("446 Myrtle Avenue", Tuples.pair("446 Мёртл Авеню", ""));

    private static final String MESSAGE_RU = "Пожалуйста, подтвердите ваш визит с доктором %s в офисе %s в %s %s по адресу %s. Нажмите 1 чтобы подтвердить, или 2 чтобы отменить визит. Нажмите 3 чтобы перенести ваш визит на другой день.";
    private static final String MESSAGE_EN = "Please confirm your appointment with Dr. %s at the office of %s at %s on %s at %s. Press 1 to confirm, 2 to cancel or 3 to reschedule";
    private static final String MESSAGE_ES = "Confirme su cita con el Dr. %s en la oficina de %s a las %s el %s en %s. Presione 1 para confirmar, 2 para cancelar o 3 para reprogramar.";
    private static final String FINAL_PROMPT_RU = "Спасибо большое!";
    private static final String FINAL_PROMPT_EN = "Thank you very much!";
    private static final String FINAL_PROMPT_ES = "¡Muchas gracias!";

    private static final String LANGUAGE_SELECTION_RU = "Пожалуйста, нажмите 1 чтобы продолжить на русском или 2 для английского";

    private static final String LANGUAGE_SELECTION_EN = "Please press 1 to switch to Spanish or 2 to continue in English";

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

    @Value("${office-forms.entry-prompt:RU}")
    private String entryPrompt;

    @Scheduled(cron = "0 0 14 * * *", zone = "America/New_York")
    public void processNotifications() {
        log.info("Starting notification processing job");
        StreamSupport.stream(this.schedulerApiService.getAppointmentToConfirm(0, 0, 1, 0).spliterator(), false).filter(appt -> appt.getApptPhone() != null).forEach(appt -> this.processNotification(appt));
        log.info("Finished notification processing job");
    }

    private void processNotification(Appointment appt) {
        var promptRu = this.finalizePrompt(MESSAGE_RU, appt, true, "RU");
        var promptEn = this.finalizePrompt(MESSAGE_EN, appt, false, "EN");
        var promptEs = this.finalizePrompt(MESSAGE_ES, appt, true, "ES");

        var phone = this.snsService.addCountryCode(this.snsService.transform(appt.getApptPhone()));

        var contactId = this.sendNotification(phone, new String[]{promptRu, promptEn, promptEs});

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
                "messageEs", messages[2],
                "finalMessageRu", FINAL_PROMPT_RU,
                "finalMessageEn", FINAL_PROMPT_EN,
                "finalMessageEs", FINAL_PROMPT_ES,
                "languageSelectionPrompt", this.entryPrompt.equals("RU") ? LANGUAGE_SELECTION_RU : LANGUAGE_SELECTION_EN);

        log.info("Sending request to AES Connect with attributes: {}", attributes);

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

    private String finalizePrompt(String msgTemplate, Appointment appt, boolean translate, String target) {
        var doctor = this.snsService.getProviderName(appt.getProviderNo());
        var date = appt.getApptDate().format(DateTimeFormatter.ofPattern("MMMM,dd"));
        var month = date.split(",")[0];
        var day = date.split(",")[1];

        return String.format(msgTemplate,
                translate ? this.translate(doctor, target) : doctor,
                translate ? this.translate(this.company, target) : this.company,
                appt.getApptStartTime(),
                day + (translate ? " " + this.translate(month, target) : " of " + month),
                translate ? this.translate(this.address, target) : this.address);
    }

    private String translate(String source, String target) {
        return "RU".equals(target)
                ? DICTIONARY.getOrDefault(source, Tuples.pair(source, source)).getOne()
                : DICTIONARY.getOrDefault(source, Tuples.pair(source, source)).getTwo();
    }

    @Scheduled(fixedDelay = 60000, initialDelay = 60000)
    public void pollResponses() {
        Notification notification;
        var batch = new ArrayList<Notification>();
        while ((notification = this.notificationQueue.poll() ) != null) {
            batch.add(notification);
        }
        log.debug("Got {} notifications to get replies for", batch.size());
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
