package com.nt.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nt.model.Courses;

public interface ICoursesRepo extends JpaRepository<Courses, Integer> {

}
