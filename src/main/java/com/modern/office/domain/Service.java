package com.modern.office.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "service")
@Data
public class Service {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="serv_no")
	private int serviceNo;
	@Column(name="service_name")
	private String serviceName;
	
	
	public int getServiceNo() {
		return serviceNo;
	}
	public void setServiceNo(int serviceNo) {
		this.serviceNo = serviceNo;
	}
	public String getServiceName() {
		return serviceName;
	}
	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}
}
