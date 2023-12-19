package com.modern.office.repository;

import org.springframework.data.repository.CrudRepository;

import com.modern.office.domain.Product;

public interface ProductRepository extends CrudRepository<Product, Integer>{
	Iterable<Product> getProductsByProductAvailable(int productAvailable);
}
