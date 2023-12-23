package com.modern.office.domain;

import java.time.LocalDate;

import javax.persistence.*;

import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

@Entity
@Table(name = "address")
@Data
@NoArgsConstructor
@Accessors(chain = true)
public class Address
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="address_no")
	private Integer addressNo;
	
	private String address1;
	
	private String address2;

	private String city;
	
	@Column(name = "state")
	private Integer stateNo;

	@Transient
	private String state;

	private String zip;
	
	private String phone1;
	private String phone2;
	private String fax;
	
	@Column(name = "wrong_address_flg")
	private Integer wrongAddressFlag;
	
	@Column(name = "update_dt")
	private LocalDate updateDate;

	@Column(name = "pa_update_dt")
	private LocalDate paUpdateDate;
}
