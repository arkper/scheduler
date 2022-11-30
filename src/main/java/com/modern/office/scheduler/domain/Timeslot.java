package com.modern.office.scheduler.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Timeslot implements Comparable<Timeslot>{
	private LocalDate date;
	private LocalDateTime startTime;
	private LocalDateTime endTime;
	private boolean available;
	
	@Override
	public int compareTo(Timeslot other) {
		if (other.getDate().isEqual(this.getDate())
				&& other.getStartTime().isEqual(this.startTime) 
				&& other.getEndTime().isEqual(this.endTime))
		{
			return 0;
		}
		else if (other.getDate().isBefore(this.getDate()))
		{
		    return -1;	
		}
		else if (other.getDate().isAfter(this.getDate()))
		{
			return 1;
		}
		else if (other.getDate().isEqual(this.getDate())
				&& other.getStartTime().isBefore(this.startTime))
		{
			return 1;
		}
		else if (other.getDate().isEqual(this.getDate())
				&& other.getStartTime().isAfter(this.startTime))
		{
			return -1;
		}

		return 1;
	}


}
