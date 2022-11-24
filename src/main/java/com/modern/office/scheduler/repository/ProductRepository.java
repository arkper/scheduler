package com.modern.office.scheduler.repository;

import org.springframework.data.repository.CrudRepository;

import com.modern.office.scheduler.domain.Product;

public interface ProductRepository extends CrudRepository<Product, Integer>{
}
