package com.modern.office.forms.services;

import com.modern.office.sns.VoiceReminderService;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.concurrent.ConcurrentLinkedQueue;

@Service
public class SignRequestService {
    private final ConcurrentLinkedQueue<Map<String, String>> requestQueue = new ConcurrentLinkedQueue<>();

    public void put(final Map<String, String> requestData){
        this.requestQueue.add(requestData);
    }

    public Map<String, String> get(){
        return this.requestQueue.poll();
    }
}
