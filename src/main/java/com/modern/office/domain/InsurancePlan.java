package com.modern.office.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Entity
@Table(name = "insurance_plans")
@Data
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
public class InsurancePlan {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="plan_no")
	private int planNo;
	
	@Column(name="insurance_no")
	private int insuranceNo;

	@Column(name="plan_name")
	private String planName;
}
