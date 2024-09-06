package com.nt.service;


import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;

import com.nt.model.Courses;
import com.nt.model.Notes;
import com.nt.repository.ICoursesRepo;

@Service
public class CoursesService implements ICoursesService {

	@Autowired
	private ICoursesRepo repoCourse;
	
	@Autowired
	private INotesService noteService;
	
	@Autowired
	private Set<Courses> myCourse;
	
	@Override
	public void saveCourse(Courses course) {
		
		repoCourse.save(course);
	}

	@Override
	public Set<Courses> getCourseById(Integer id) {
		
		Optional<Courses> opt = repoCourse.findById(id);
		if(opt.isPresent())
			myCourse.add(opt.get());
		return myCourse;
	}

	@Override
	public Set<Courses> getAllCourses() {
		List<Courses> all = repoCourse.findAll();
		Set<Courses> allCourses=new HashSet<Courses>(all);
		return allCourses;
	}

	

	
}
