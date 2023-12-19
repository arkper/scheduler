package com.modern.office.sns;

import com.amazonaws.services.lambda.runtime.Context;
import com.amazonaws.services.lambda.runtime.RequestHandler;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.sqs.SqsClient;
import software.amazon.awssdk.services.sqs.model.SendMessageRequest;

public class AwsVoiceResponseLambda implements RequestHandler<VoiceResponse, Integer> {
    @Override
    public Integer handleRequest(VoiceResponse voiceResponse, Context context) {
        SqsClient sqsClient = SqsClient.builder()
                .region(Region.US_EAST_1)
                .build();

        sqsClient.sendMessage(SendMessageRequest
                .builder()
                .queueUrl("https://sqs.us-east-1.amazonaws.com/622853243487/sns-reply-queue")
                .messageBody(voiceResponse.appointmentNo() + "," + voiceResponse.customerResponse())
                .build());

        return voiceResponse.customerResponse();
    }
}
