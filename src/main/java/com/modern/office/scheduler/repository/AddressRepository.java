package com.modern.office.scheduler.repository;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.modern.office.scheduler.domain.Address;

public interface AddressRepository extends CrudRepository<Address, Integer>{
	@Modifying
	@Query("update Address a set a.phone1 = :newPhoneNumber where a.addressNo=:addressNo")
	Address updatePhone(int addressNo, String newPhoneNumber);
}
