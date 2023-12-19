package com.modern.office.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

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
