package com.modern.office.scheduler.domain;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "address")
@Data
public class Address {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="address_no")
	private int addressNo;
	
	private String address1;
	
	private String address2;

	private String city;
	
	@Column(name = "state")
	private int stateNo;

	private String zip;
	
	private String phone1;
	private String phone2;
	private String fax;
	
	@Column(name = "wrong_address_flg")
	private int wrongAddressFlag;
	
	@Column(name = "update_dt")
	private LocalDate updateDate;

	@Column(name = "pa_update_dt")
	private LocalDate paUpdateDate;
}
