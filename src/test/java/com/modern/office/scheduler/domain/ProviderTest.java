package com.modern.office.scheduler.domain;

import com.modern.office.domain.Provider;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;


public class ProviderTest {
	
	@Test
	void testSerilaization() throws JsonProcessingException
	{
		Provider provider = new Provider();
		provider.setProviderLastName("Doe");
		provider.setProviderFirstName("Joe");
		provider.setProviderNo(1);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(provider);
		
		Assertions.assertNotNull(json);
	}
	
}
