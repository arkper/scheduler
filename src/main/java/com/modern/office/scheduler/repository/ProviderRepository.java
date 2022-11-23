package com.modern.office.scheduler.repository;

import org.springframework.data.repository.CrudRepository;

import com.modern.office.scheduler.domain.Provider;

public interface ProviderRepository extends CrudRepository<Provider, Integer> {
}
