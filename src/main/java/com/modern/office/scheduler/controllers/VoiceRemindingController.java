package com.modern.office.scheduler.controllers;

import com.modern.office.sns.VoiceReminderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/voice")
@Slf4j
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
                request.phone(), new String[]{request.messageRu, request.messageEn});
    }

    public static record RemindRequest(String phone, String messageRu, String messageEn) {
    }
}