package com.modern.office.scheduler.repository;

import org.springframework.data.repository.CrudRepository;

import com.modern.office.scheduler.domain.ProviderBlock;

public interface ProviderBlockRepository extends CrudRepository<ProviderBlock, Integer> {
	Iterable<ProviderBlock> findAllByProviderNo(int providerNo);
}
