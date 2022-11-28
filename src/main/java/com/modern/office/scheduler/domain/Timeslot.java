package com.modern.office.scheduler.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Timeslot {
	private LocalDate date;
	private LocalDateTime startTime;
	private LocalDateTime endTime;
	private boolean available;
}
