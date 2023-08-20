package com.modern.office.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.web.SecurityFilterChain;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import lombok.Getter;

@SpringBootApplication(scanBasePackages = { "com.modern.office.scheduler", "com.modern.office.sns" })
@EnableJpaRepositories
@EnableConfigurationProperties
@EnableCaching
@EnableScheduling
public class SchedulerApplication {

	public static void main(String[] args) {
		SpringApplication.run(SchedulerApplication.class, args);
	}

	@Bean
	public ObjectMapper objectMapper() {
		ObjectMapper mapper = new ObjectMapper();

		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

		mapper.setSerializationInclusion(Include.NON_NULL);

		// Write times as a String instead of a Long so its human readable.
		mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
		mapper.registerModule(new JavaTimeModule());

		return mapper;
	}

	@Configuration
	@EnableWebSecurity
	@EnableGlobalMethodSecurity(prePostEnabled = true)
	@Getter
	public class SecurityConfig {
		@Autowired
		private CustomIpAuthenticationProvider authenticationProvider;

		@Bean
		public AuthenticationManager authManager(HttpSecurity http) throws Exception {
			AuthenticationManagerBuilder authenticationManagerBuilder = 
					http.getSharedObject(AuthenticationManagerBuilder.class);
			authenticationManagerBuilder.authenticationProvider(authenticationProvider);
			return authenticationManagerBuilder.build();
		}

		@Bean
		public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
			http.authorizeRequests().antMatchers("/sns/reply").permitAll();
			
			http
			   .csrf().disable()
			   .authorizeRequests()
			   .anyRequest().authenticated().and().httpBasic();
			return http.build();
		}
	}
}