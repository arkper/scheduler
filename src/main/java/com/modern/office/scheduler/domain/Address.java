package com.modern.office.scheduler.domain;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "address")
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
	public int getAddressNo() {
		return addressNo;
	}
	public void setAddressNo(int addressNo) {
		this.addressNo = addressNo;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getStateNo() {
		return stateNo;
	}
	public void setStateNo(int stateNo) {
		this.stateNo = stateNo;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getFax() {
		return fax;
	}
	public void setFax(String fax) {
		this.fax = fax;
	}
	public int getWrongAddressFlag() {
		return wrongAddressFlag;
	}
	public void setWrongAddressFlag(int wrongAddressFlag) {
		this.wrongAddressFlag = wrongAddressFlag;
	}
	public LocalDate getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(LocalDate updateDate) {
		this.updateDate = updateDate;
	}
	public LocalDate getPaUpdateDate() {
		return paUpdateDate;
	}
	public void setPaUpdateDate(LocalDate paUpdateDate) {
		this.paUpdateDate = paUpdateDate;
	}
}
