package com.modern.office;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;
import com.modern.office.config.AppConfig;
import com.modern.office.config.CustomIpAuthenticationProvider;
import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
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
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authorization.AuthorizationDecision;
import org.springframework.security.authorization.AuthorizationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.intercept.RequestAuthorizationContext;
import org.springframework.security.web.authentication.WebAuthenticationDetails;

import java.util.ArrayList;
import java.util.List;
import java.util.function.Supplier;

@SpringBootApplication(scanBasePackages = {"com.modern.office"})
@EnableJpaRepositories
@EnableConfigurationProperties
@EnableCaching
@EnableScheduling
@Slf4j
public class OfficeFormsApplication {

    public static void main(String[] args) {
        SpringApplication.run(OfficeFormsApplication.class, args);
    }

    @Bean
    public ObjectMapper objectMapper() {
        ObjectMapper mapper = new ObjectMapper();

        mapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);

        mapper.setSerializationInclusion(Include.NON_NULL);

        // Write times as a String instead of a Long so its human readable.
        mapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false);
        mapper.configure(SerializationFeature.FAIL_ON_EMPTY_BEANS, false);
        mapper.registerModule(new JavaTimeModule());

        return mapper;
    }

    static class CustomAuthorizationManager implements AuthorizationManager<RequestAuthorizationContext> {
        private final AppConfig appConfig;

        public CustomAuthorizationManager(AppConfig appConfig){
            this.appConfig = appConfig;
        }
        @Override
        public AuthorizationDecision check(Supplier<Authentication> authentication, RequestAuthorizationContext object) {
            WebAuthenticationDetails details = (WebAuthenticationDetails) authentication.get().getDetails();
            String userIp = details.getRemoteAddress();
            log.info("Remote IP address: " + userIp);
            if (!userIp.startsWith("192.168") && !userIp.startsWith("localhost")
                    && !this.appConfig.getWhiteList().contains(userIp))
            {
                throw new BadCredentialsException("Invalid IP Address");
            }
            else {
                final List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
                authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
                return new AuthorizationDecision(true);
            }
        }
    }

    @Configuration
    @EnableWebSecurity
    @EnableMethodSecurity(prePostEnabled = true)
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
        public SecurityFilterChain filterChain(HttpSecurity http, AppConfig appConfig) throws Exception {
            http.cors(AbstractHttpConfigurer::disable)
                    .csrf(AbstractHttpConfigurer::disable)
                    .authorizeHttpRequests(authorize -> authorize
                            .requestMatchers("/**")
                            .access(new CustomAuthorizationManager(appConfig)));

//            http.cors(AbstractHttpConfigurer::disable)
//                    .csrf(AbstractHttpConfigurer::disable)
//                    .authorizeHttpRequests(auth -> auth
//                            .requestMatchers( "/sns/reply").permitAll()
//                            .anyRequest().authenticated()
//                    )
//                    .authenticationManager(authManager)
//                    .httpBasic(Customizer.withDefaults());

            return http.build();
        }
    }
}