package com.modern.office.scheduler.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "provider")
public class Provider {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "provider_no")
	private int providerNo;
	@Column(name = "provider_first_name")
	private String providerFirstName;
	@Column(name = "provider_last_name")
	private String providerLastName;
	@Column(name = "provider_middle_initial")
	private String providerMiddleInitial;

	public int getProviderNo() {
		return providerNo;
	}
	public void setProviderNo(int providerNo) {
		this.providerNo = providerNo;
	}
	public String getProviderFirstName() {
		return providerFirstName;
	}
	public void setProviderFirstName(String providerFirstName) {
		this.providerFirstName = providerFirstName;
	}
	public String getProviderLastName() {
		return providerLastName;
	}
	public void setProviderLastName(String providerLastName) {
		this.providerLastName = providerLastName;
	}
	public String getProviderMiddleInitial() {
		return providerMiddleInitial;
	}
	public void setProviderMiddleInitial(String providerMiddleInitial) {
		this.providerMiddleInitial = providerMiddleInitial;
	}
}
