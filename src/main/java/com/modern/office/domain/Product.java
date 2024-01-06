package com.modern.office.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "product")
@Data
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="prd_no")
	private int prdNo;
	
	@Column(name = "prd_desc")
	private String prdDescription;
	
	@Column(name = "prd_appsch_ind")
	private int productAvailable;
}
