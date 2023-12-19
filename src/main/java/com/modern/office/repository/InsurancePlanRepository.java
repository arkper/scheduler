package com.modern.office.repository;

import org.springframework.data.repository.CrudRepository;

import com.modern.office.domain.InsurancePlan;

public interface InsurancePlanRepository  extends CrudRepository<InsurancePlan, Integer> {
    Iterable<InsurancePlan> findInsurancePlansByInsuranceNo(int insuranceNo);
}
