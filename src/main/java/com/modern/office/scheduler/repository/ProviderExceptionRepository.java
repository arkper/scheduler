package com.modern.office.scheduler.repository;

import java.time.LocalDate;

import org.springframework.data.repository.CrudRepository;

import com.modern.office.scheduler.domain.ProviderException;

public interface ProviderExceptionRepository extends CrudRepository<ProviderException, Integer> {
	Iterable<ProviderException> getProviderExceptionsByProviderNo(int providerNo);
	Iterable<ProviderException> getProviderExceptionsByProviderNoAndExceptionDateBetween(int providerNo, LocalDate fromDate, LocalDate endDate);
}
