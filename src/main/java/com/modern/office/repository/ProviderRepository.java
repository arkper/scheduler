package com.modern.office.repository;

import org.springframework.data.repository.CrudRepository;

import com.modern.office.domain.Provider;

public interface ProviderRepository extends CrudRepository<Provider, Integer> {
	Iterable<Provider> getProviderByIsProviderAndProviderActive(int isProvider, boolean providerActive);
}
