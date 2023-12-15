package com.modern.office.scheduler.controllers;

import com.modern.office.sns.VoiceReminderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController("/voice")
@Slf4j
@RequiredArgsConstructor
public class VoiceRemindingController {
    private final VoiceReminderService voiceReminderService;

    @PostMapping(path = "/remind")
    void remind() {
        this.voiceReminderService.processNotifications();
    }
}
