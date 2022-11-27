package com.modern.office.scheduler.repository;

import org.hibernate.annotations.SQLUpdate;
import org.springframework.data.repository.CrudRepository;

import com.modern.office.scheduler.domain.Address;

public interface AddressRepository extends CrudRepository<Address, Integer>{
	@SQLUpdate(sql = "update Address set phone1 = ?")
	Address updatePhone(String newPhoneNumber);
}
