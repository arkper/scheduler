package com.modern.office.domain;

import java.time.LocalDate;
import java.util.Set;

import jakarta.persistence.*;

import lombok.Data;
import lombok.experimental.Accessors;

@Entity
@Table(name = "patient")
@Data
@Accessors(chain = true)
public class Patient {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="patient_no")
	private Integer patientNo;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "address_no", referencedColumnName = "address_no")
	private Address address = null;
	
	@Column(name = "address_no_old")
	private Integer addressNoOld;

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
	private Integer sourceCode = 12;
	
	@Column(name = "mid_name")
	private String midName = "";
	
	@Column(name = "suffix")
	private String suffix = "";
	
	@Column(name = "sex")
	private Integer sex = 0;
	
	@Column(name = "ss_no")
	private String ssNo = "";
	
	@Column(name = "title")
	private String title = "";

	@Column(name = "active")
	private Integer active = 1;
	
	@Column(name = "locationid")
	private Integer locationId = 2;
	
	@Column(name = "entry_date")
	private LocalDate entryDate = LocalDate.now();
	
	@Column(name = "provider_cd")
	private Integer providerCd = 20;

	public Patient transform(){
		this.setSex(this.getSex() == 0 ? 1 : 0);
		return this;
	}
}
