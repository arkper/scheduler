package com.modern.office.scheduler.domain;

import java.time.LocalDate;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "patient")
@Data
public class Patient {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="patient_no")
	private int patientNo;
	
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER, orphanRemoval = false)
	@JoinColumn(name = "address_no", referencedColumnName = "address_no")
	private Address address;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "patientNo", fetch = FetchType.EAGER, orphanRemoval = true)
	private Set<PatientInsurance> patientInsurances;
	
	@Column(name = "last_name")
	private String lastName;
	
	@Column(name = "first_name")
	private String firstName;

	@Column(name = "salutation")
	private String salutation;
	
	@Column(name = "birth_date")
	private LocalDate birthDate;

	@Column(name = "source_cd")
	private int sourceCode = 12;
	
	@Column(name = "mid_name")
	private String midName = "";
	
	@Column(name = "suffix")
	private String suffix = "";
	
	@Column(name = "sex")
	private int sex = 0;
	
	@Column(name = "ss_no")
	private String ssNo = "";
	
	@Column(name = "title")
	private String title = "";

	@Column(name = "active")
	private int active = 1;
	
	@Column(name = "locationid")
	private int locationId = 2;
	
	@Column(name = "entry_date")
	private LocalDate entryDate = LocalDate.now();
	
	@Column(name = "provider_cd")
	private int providerCd = 20;
}
