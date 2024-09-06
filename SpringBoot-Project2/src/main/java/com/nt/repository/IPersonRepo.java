package com.nt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;

import com.nt.model.Person;

public interface IPersonRepo extends JpaRepository<Person,Integer> {

	
}
