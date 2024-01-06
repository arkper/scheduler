package com.modern.office.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

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
