package com.modern.office.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

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
