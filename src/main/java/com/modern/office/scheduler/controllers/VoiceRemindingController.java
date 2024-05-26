package com.modern.office.scheduler.controllers;

import com.modern.office.sns.VoiceReminderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.annotation.Profile;
import org.springframework.web.bind.annotation.*;

@CrossOrigin("*")
@RestController
@RequestMapping("/voice")
@Slf4j
@Profile("sns")
@RequiredArgsConstructor
public class VoiceRemindingController {
    private final VoiceReminderService voiceReminderService;

    @PostMapping(path = "/process")
    void process() {
        this.voiceReminderService.processNotifications();
    }

    @PostMapping(path = "/remind")
    String remind(@RequestBody RemindRequest request) {
        return this.voiceReminderService.sendNotification(
                request.phone(), new String[]{request.messageRu, request.messageEn, request.messageEs});
    }

    public static record RemindRequest(String phone, String messageRu, String messageEn, String messageEs) {
    }
}
