package com.nt.controller;

import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.nt.model.Courses;
import com.nt.service.ICoursesService;

@Controller
public class CoursesOperationsController {

	@Autowired
	private ICoursesService courseService;

	@Autowired
	private Set<Courses> allCourses;

	@GetMapping("/java")
	public String showGetPageJava() {
		return "show_java";
	}

	@GetMapping("/buy")
	public String showGetBuyPageJava(@RequestParam("cno") Integer no, Model model) {
		System.out.println(no);
		Set<Courses> courses = courseService.getCourseById(no); 
		model.addAttribute("courses", courses);
        courses.forEach(System.out::println);
		
		double totalPrice = courses.stream().mapToDouble(course -> {
			try {
				return Double.parseDouble(course.getPrice());
			} catch (NumberFormatException e) {
				return 0.0; 
			}
		}).sum();
		model.addAttribute("totalPrice", totalPrice);
		
		return "show_buy";
	}

	@GetMapping("/delete")
	public String deleteGetPage(@RequestParam("cno") Integer cnum,Model model) {
        
		allCourses = allCourses.stream().filter(course -> !cnum.equals(course.getCid())).collect(Collectors.toSet());
		allCourses.forEach(System.out::println); 
		double totalPrice = allCourses.stream().mapToDouble(course -> {
			try {
				return Double.parseDouble(course.getPrice());
			} catch (NumberFormatException e) {
				return 0.0; 
			}
		}).sum();
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("courses", allCourses);
		return "show_newBuy";
	}

	@GetMapping("/ui")
	public String showGetPageUI() {
		return "show_ui";
	}

	@GetMapping("/python")
	public String showGetPagePython() {
		return "show_python";
	}

	@GetMapping("/datastructure")
	public String showGetPageDataStructure() {
		return "show_datastructure";
	}

	@GetMapping("/design")
	public String showGetPageDesign() {
		return "show_design";
	}
	
	@GetMapping("/c")
	public String showGetPageC() {
		return "show_c";
	}
}
