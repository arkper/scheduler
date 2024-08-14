package com.modern.office.config;

import lombok.Data;
import org.eclipse.collections.api.factory.Maps;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.Map;

@Component
@ConfigurationProperties(prefix = "office-forms")
@Data
public class ClientMappings {
    private Map<String, String> mappings;

    public ClientMappings(){
        mappings = Maps.mutable.empty();
    }
}
