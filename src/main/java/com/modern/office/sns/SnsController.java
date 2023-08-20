package com.modern.office.sns;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController("/sns")
@Slf4j
@RequiredArgsConstructor
public class SnsController {
	private final SnsService snsService;

	@PostMapping("/send/{phone-number}")
	public ResponseEntity<String> sendSms(@RequestBody final String message, @PathVariable("phone-number") final String phoneNumber)
	{
		try
		{
			return ResponseEntity.ok(snsService.sendSMS(message, phoneNumber));
		}
		catch (Exception e)
		{
			log.error("Failed sending SMS", e);
			return new ResponseEntity<>(HttpStatus.SERVICE_UNAVAILABLE);
		}
	}
	
	@PostMapping("/process")
	public ResponseEntity<String> processNotifications()
	{
		try
		{
			snsService.processNotifications();
			return ResponseEntity.ok("Finished processings");
		}
		catch (Exception e)
		{
			log.error("Failed sending SMS", e);
			return new ResponseEntity<>(HttpStatus.SERVICE_UNAVAILABLE);
		}
	}

	@PostMapping("/reply")
	public String acceptReply(@RequestBody String message) throws JsonMappingException, JsonProcessingException
	{
		log.info("Received: " + message);
		this.snsService.processReply(message);
		return "ok";
	}
	
	@PostMapping("/subscribe/{uri}")
	public ResponseEntity<String> subscribe(@PathVariable("uri") final String uri)
	{
		try
		{
			return ResponseEntity.ok(this.snsService.subscribe(uri));
		}
		catch (Exception e)
		{
			log.error("Failed subscribing to SMS notification", e);
			return new ResponseEntity<>(HttpStatus.SERVICE_UNAVAILABLE);
		}
	}
}
