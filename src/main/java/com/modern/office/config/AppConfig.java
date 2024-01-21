package com.modern.office.config;

import java.util.List;
import java.util.Set;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import lombok.Getter;
import lombok.Setter;
import software.amazon.awssdk.auth.credentials.AwsBasicCredentials;
import software.amazon.awssdk.auth.credentials.StaticCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.connect.ConnectClient;
import software.amazon.awssdk.services.sns.SnsClient;
import software.amazon.awssdk.services.sqs.SqsClient;

import jakarta.annotation.PostConstruct;

@Configuration
@ConfigurationProperties(prefix = "scheduler")
@Getter
@Setter
@Slf4j
public class AppConfig {
	private String user;
	private String pwd;
	private List<String> whiteList;
	private List<String> insurances;
	private List<Integer> providers;
	private Set<String> allowedPhones;
	
	private String accessKey; 
	private String accessSecret;
	private String topicIncoming;
	private String blackListLocation;
	private String originalIp;
	private String ipAdminPhone;
	private String officeName;

	private AwsBasicCredentials awsCredentials = null;

	@PostConstruct
	void setupCredentials()
	{
		awsCredentials = AwsBasicCredentials.create(
				this.getAccessKey(),
				this.getAccessSecret());
	}

	@Bean
	public SnsClient snsClient()
	{
		var snsClient = SnsClient.builder()
				.region(Region.US_EAST_1)
				.credentialsProvider(StaticCredentialsProvider.create(awsCredentials))
				.build();
		log.info("Initialized SNS client");
		return snsClient;
	}

	@Bean
	public ConnectClient connectClient() {
		return ConnectClient.builder()
				.region(Region.US_EAST_1)
				.credentialsProvider(StaticCredentialsProvider.create(awsCredentials))
				.build();
	}

	@Bean
	public SqsClient sqsClient() {
		return SqsClient.builder()
				.region(Region.US_EAST_1)
				.credentialsProvider(StaticCredentialsProvider.create(awsCredentials))
				.build();
	}
}
