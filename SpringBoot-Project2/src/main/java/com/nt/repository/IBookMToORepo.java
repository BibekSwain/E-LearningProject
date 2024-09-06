package com.nt.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nt.model.Books_MToO;

public interface IBookMToORepo extends JpaRepository<Books_MToO, Integer> {

}
