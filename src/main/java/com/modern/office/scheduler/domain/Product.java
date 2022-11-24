package com.modern.office.scheduler.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="prd_no")
	private int prdNo;
	
	@Column(name = "prd_desc")
	private String prdDescription;
	
	@Column(name = "prd_appsch_ind")
	private int productAvailable;

	public int getPrdNo() {
		return prdNo;
	}

	public void setPrdNo(int prdNo) {
		this.prdNo = prdNo;
	}

	public String getPrdDescription() {
		return prdDescription;
	}

	public void setPrdDescription(String prdDescription) {
		this.prdDescription = prdDescription;
	}

	public int getProductAvailable() {
		return productAvailable;
	}

	public void setProductAvailable(int productAvailable) {
		this.productAvailable = productAvailable;
	}
}
