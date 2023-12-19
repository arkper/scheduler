package com.modern.office.sns;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.modern.office.config.AppConfig;
import com.modern.office.OfficeFormsApplication;
import com.modern.office.scheduler.services.SchedulerApiService;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.web.WebAppConfiguration;
import software.amazon.awssdk.services.sns.SnsClient;
import software.amazon.awssdk.services.sqs.SqsClient;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = {AppConfig.class, OfficeFormsApplication.class})
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
    private SqsClient sqsClient;

    @Autowired
    private AppConfig appConfig;

    @Autowired
    private ObjectMapper objectMapper;

    private SnsService testObj;
    @Test
    void testOptedOutCall()
    {
        this.testObj = new SnsService(appConfig, schedulerApiService, objectMapper, snsClient, sqsClient);

        boolean phoneOptedOut = this.testObj.isPhoneOptedOut("+13474435562");

        Assertions.assertTrue(phoneOptedOut);
    }

}
