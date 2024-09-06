package com.nt.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nt.model.User_OToM;

public interface IUserOToMRepo extends JpaRepository<User_OToM, Integer> {

}
