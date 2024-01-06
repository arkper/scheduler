package com.modern.office.domain;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

import lombok.Data;

@Entity
@Table(name = "code")
@Data
public class Code {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int code;
	
	@Column(name="code_category_cd")
	private int category;
	
	@Column(name="user_code")
	private String userCode;

	@Column(name="description")
	private String description;
}
