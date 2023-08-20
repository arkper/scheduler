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
@Table(name = "provider")
@Data
@Accessors(chain = true)
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

	@Column(name = "is_provider")
	private int isProvider;

	@Column(name = "provider_active")
	private boolean providerActive;
}
