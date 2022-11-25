package com.modern.office.scheduler;

import java.util.HashSet;
import java.util.Set;

import javax.naming.AuthenticationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.core.userdetails.User;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

@SpringBootApplication(scanBasePackages = {"com.modern.office.scheduler"})
@EnableJpaRepositories
public class SchedulerApplication {

	public static void main(String[] args) {
		SpringApplication.run(SchedulerApplication.class, args);
	}
	
	@Bean
	public ObjectMapper objectMapper()
	{
		ObjectMapper mapper = new ObjectMapper();
		
		mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		
	    mapper.setSerializationInclusion(Include.NON_NULL);

	    // Write times as a String instead of a Long so its human readable.
	    mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
	    mapper.registerModule(new JavaTimeModule());

	    return mapper;
	}
	
	@SuppressWarnings("deprecation")
	@Configuration
	@EnableWebSecurity//(debug = true)
	public class SecurityConfig extends WebSecurityConfigurerAdapter {

	    @Autowired
	    private CustomIpAuthenticationProvider authenticationProvider;

	    @Override
	    protected void configure(final AuthenticationManagerBuilder auth) throws Exception {
	       //auth.inMemoryAuthentication().withUser("john").password("{noop}123").authorities("ROLE_USER");
	       auth.authenticationProvider(authenticationProvider);
	    }

	    @Override
	    protected void configure(final HttpSecurity http) throws Exception {
	        // @formatter:off
	        http.authorizeRequests()
	            .antMatchers("/login").permitAll()
//	            .antMatchers("/foos/**").hasIpAddress("11.11.11.11")
	            .antMatchers("/foos/**").access("isAuthenticated() and hasIpAddress('11.11.11.11')")
	            .anyRequest().authenticated()
	            .and().formLogin().permitAll()
	            .and().csrf().disable();
	        // @formatter:on
	    }
    }
}
