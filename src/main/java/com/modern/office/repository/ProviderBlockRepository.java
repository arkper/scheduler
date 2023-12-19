package com.modern.office.repository;

import org.springframework.data.repository.CrudRepository;

import com.modern.office.domain.ProviderBlock;

public interface ProviderBlockRepository extends CrudRepository<ProviderBlock, Integer> {
	Iterable<ProviderBlock> findAllByProviderNo(int providerNo);
}
