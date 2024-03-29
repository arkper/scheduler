package com.modern.office.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import lombok.Data;
import lombok.experimental.Accessors;

@Entity
@Table(name="patient_insurances")
@Data
@Accessors(chain = true)
public class PatientInsurance {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="patinsid")
	private int patientInsuranceNo;
	
	@Column(name="patient_no")
	private int patientNo;
	
	@Column(name="ins_seq")
	private int insSeqNo;
	
	@Column(name="insurance_no")
	private int insuranceNo;
	
	@Column(name="ins_group_no")
	private Integer insuranceGroupNo;
	
	@Column(name="insured_type")
	private Integer insuredTypeNo = 0;
	
	@Column(name="insured_no")
	private Integer insuredNo;
	
	@Column(name="relation_to_insured")
	private int relationToInsuredNo;
	
	@Column(name="ppo_hmo")
	private Integer ppoHmoNo;
	
	@Column(name="insurance_status")
	private Integer insuranceStatus = 0;
	
	@Column(name="insured_id")
	private String insuredId;

	@Column(name="inactive")
	private int inactive = 0;
}
