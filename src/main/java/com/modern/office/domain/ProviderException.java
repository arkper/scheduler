package com.modern.office.domain;

import java.time.LocalDate;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import lombok.Data;
import lombok.experimental.Accessors;

@Entity
@Table(name = "Appsch_Provider_Exception")
@Data
@Accessors(chain = true)
public class ProviderException {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "pro_exception_no")
	private int providerExceptionNo;
	
	@Column(name = "pro_no")
	private int providerNo;
	
	@Column(name = "locationid")
	private int localtionId = 2;

	@Column(name = "pro_available_ind")
	private int providerAvailableInd;
	
	@Column(name = "pro_start_time")
	private String startTime;

	@Column(name = "pro_end_time")
	private String endTime;

	@Column(name = "pro_exception_date")
	private LocalDate exceptionDate;

	@Column(name = "pro_notes")
	private String notes;

	@Column(name = "pro_delete_ind")
	private int deleteInd;
}
