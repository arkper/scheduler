package com.modern.office.repository;

import org.springframework.data.repository.CrudRepository;

import com.modern.office.domain.Code;

public interface CodeRepository extends CrudRepository<Code, Integer> {
	Iterable<Code> getCodesByCategory(int category);
}
