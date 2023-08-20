package com.modern.office.scheduler;

import java.util.List;
import java.util.Set;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Configuration;

import lombok.Getter;
import lombok.Setter;

@Configuration
@ConfigurationProperties(prefix = "scheduler")
@Getter
@Setter
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
}
