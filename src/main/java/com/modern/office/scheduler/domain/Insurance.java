package com.modern.office.scheduler.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Builder;
import lombok.Data;

@Entity
@Table(name = "insurance")
@Data
@Builder
public class Insurance {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="insurance_no")
	private int insuranceNo;
	@Column(name="insurance_name")
	private String insuranceName;
}
