package com.modern.office.scheduler.repository;

import org.springframework.data.repository.CrudRepository;

import com.modern.office.scheduler.domain.InsurancePlan;

public interface InsurancePlanRepository  extends CrudRepository<InsurancePlan, Integer> {
    Iterable<InsurancePlan> findInsurancePlansByInsuranceNo(int insuranceNo);
}
