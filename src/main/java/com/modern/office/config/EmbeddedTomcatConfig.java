package com.modern.office.config;

import lombok.extern.slf4j.Slf4j;
import org.apache.catalina.connector.Connector;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Slf4j
// @Configuration
public class EmbeddedTomcatConfig {
    @Value("${server.http-port:9988}")
    private Integer serverHttpPort;

    public class TomcatWebServerHttpPortCustomizer
            implements WebServerFactoryCustomizer<TomcatServletWebServerFactory> {
        @Override
        public void customize(TomcatServletWebServerFactory factory) {
            if (serverHttpPort > 0) {
                Connector connector = new Connector(TomcatServletWebServerFactory.DEFAULT_PROTOCOL);
                connector.setPort(serverHttpPort);
                factory.addAdditionalTomcatConnectors(connector);
            }
        }
    }

    @Bean
    public WebServerFactoryCustomizer<TomcatServletWebServerFactory> containerCustomizer() {
        return new TomcatWebServerHttpPortCustomizer();
    }
}
