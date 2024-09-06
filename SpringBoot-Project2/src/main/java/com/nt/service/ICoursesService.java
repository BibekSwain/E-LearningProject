package com.nt.service;

import java.util.Set;

import com.nt.model.Courses;
import com.nt.model.Notes;

public interface ICoursesService {

	public void saveCourse(Courses course);
	public Set<Courses> getCourseById(Integer id);
	public Set<Courses> getAllCourses();
	
}
