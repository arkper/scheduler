package com.modern.office.scheduler.domain;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Appsch_Appointment")
public class Appointment {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="appt_no")
	private int apptNo;

	@Column(name="serv_no")
	private int servNo;
	
	@Column(name="pro_no")
	private int providerNo;

	@Column(name="LocationID")
	private int locationId;
	
	@Column(name="ins_no")
	private int insuranceNo;

	@Column(name="appt_name")
	private String apptName;

	@Column(name="appt_phone")
	private String apptPhone;

	@Column(name="appt_address")
	private String apptAddress;

	@Column(name="appt_notes")
	private String apptNotes;

	@Column(name="appt_date")
	private LocalDate apptDate;

	@Column(name="appt_start_time")
	private String apptStartTime;

	@Column(name="appt_end_time")
	private String apptEndTime;

	@Column(name="appt_dayofweek")
	private int apptDayofWeek;

	@Column(name="appt_color")
	private int apptColor;

	public int getApptNo() {
		return apptNo;
	}

	public void setApptNo(int apptNo) {
		this.apptNo = apptNo;
	}

	public int getServNo() {
		return servNo;
	}

	public void setServNo(int servNo) {
		this.servNo = servNo;
	}

	public int getProviderNo() {
		return providerNo;
	}

	public void setProviderNo(int providerNo) {
		this.providerNo = providerNo;
	}

	public int getLocationId() {
		return locationId;
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}

	public int getInsuranceNo() {
		return insuranceNo;
	}

	public void setInsuranceNo(int insuranceNo) {
		this.insuranceNo = insuranceNo;
	}

	public String getApptName() {
		return apptName;
	}

	public void setApptName(String apptName) {
		this.apptName = apptName;
	}

	public String getApptPhone() {
		return apptPhone;
	}

	public void setApptPhone(String apptPhone) {
		this.apptPhone = apptPhone;
	}

	public String getApptAddress() {
		return apptAddress;
	}

	public void setApptAddress(String apptAddress) {
		this.apptAddress = apptAddress;
	}

	public String getApptNotes() {
		return apptNotes;
	}

	public void setApptNotes(String apptNotes) {
		this.apptNotes = apptNotes;
	}

	public LocalDate getApptDate() {
		return apptDate;
	}

	public void setApptDate(LocalDate apptDate) {
		this.apptDate = apptDate;
	}

	public String getApptStartTime() {
		return apptStartTime;
	}

	public void setApptStartTime(String apptStartTime) {
		this.apptStartTime = apptStartTime;
	}

	public String getApptEndTime() {
		return apptEndTime;
	}

	public void setApptEndTime(String apptEndTime) {
		this.apptEndTime = apptEndTime;
	}

	public int getApptDayofWeek() {
		return apptDayofWeek;
	}

	public void setApptDayofWeek(int apptDayofWeek) {
		this.apptDayofWeek = apptDayofWeek;
	}

	public int getApptColor() {
		return apptColor;
	}

	public void setApptColor(int apptColor) {
		this.apptColor = apptColor;
	}
}
