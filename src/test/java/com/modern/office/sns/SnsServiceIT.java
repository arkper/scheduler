package com.modern.office.sns;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.modern.office.scheduler.AppConfig;
import com.modern.office.scheduler.SchedulerApplication;
import com.modern.office.scheduler.services.SchedulerApiService;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;
import software.amazon.awssdk.services.sns.SnsClient;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = {AppConfig.class, SchedulerApplication.class})
@WebAppConfiguration()
public class SnsServiceIT {
    @BeforeEach
    void setUp() {
        System.setProperty("spring.profiles.active", "test");
    }
    @Autowired
    private SchedulerApiService schedulerApiService;

    @Autowired
    private SnsClient snsClient;

    @Autowired
    private AppConfig appConfig;

    @Autowired
    private ObjectMapper objectMapper;

    private SnsService testObj;
    @Test
    void testOptedOutCall()
    {
        this.testObj = new SnsService(appConfig, schedulerApiService, objectMapper, snsClient);

        boolean phoneOptedOut = this.testObj.isPhoneOptedOut("+13474435562");

        Assertions.assertTrue(phoneOptedOut);
    }

}
