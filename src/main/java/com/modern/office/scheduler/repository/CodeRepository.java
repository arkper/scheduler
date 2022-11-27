package com.modern.office.scheduler.repository;

import org.springframework.data.repository.CrudRepository;

import com.modern.office.scheduler.domain.Code;

public interface CodeRepository extends CrudRepository<Code, Integer> {
	Iterable<Code> getCodesByCategory(int category);
}
