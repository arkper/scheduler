package com.modern.office.scheduler.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;
import lombok.experimental.Accessors;

@Entity
@Data
@Table(name = "business")
@Accessors(chain = true)
public class Business {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="business_no")
	private int businessNo;

	@Column(name="business_name1")
	private String businessName;
	
	@Column(name="business_address1")
	private String address1;

	@Column(name="business_address2")
	private String address2;
	
	@Column(name="business_city")
	private String city;

	@Column(name="state_cd")
	private String stateCode;
	
	@Column(name="business_zip_code")
	private String zipCode;

	@Column(name="business_phone")
	private String phone;
	@Column(name="business_fax")
	private String fax;
	
	@Column(name="business_contact")
	private String contact;
}
