package com.modern.office.domain;

import jakarta.persistence.*;

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

	@Transient
	private String providerName;

	public String getProviderName() {
		return this.providerFirstName + " " + this.getProviderLastName();
	}
}
