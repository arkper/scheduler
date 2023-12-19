package com.modern.office.domain;

import lombok.Getter;

public enum CodeCategory {
	STATE_CODE_CATEGORY(32),
	RELATION_TO_INSURED_CATEGORY(59),
	PPO_HMO_AGREEMENT_CATEGORY(305),
	POLICY_TYPE_CATEGORY(411),	
	SOURCE_CODE_CATEGORY(8);	

	@Getter
	private int value;
	
	private CodeCategory(int value)
	{
		this.value = value;
	}
}
