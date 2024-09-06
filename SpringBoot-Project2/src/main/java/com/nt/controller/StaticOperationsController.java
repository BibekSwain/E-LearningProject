package com.nt.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StaticOperationsController {

	@GetMapping("/about")
	public String aboutMethod()
	{
		return "show_about";
	}
	
	@GetMapping("/contact")
	public String contactMethod()
	{
		return "show_contact";
	}
	
	@GetMapping("/help")
	public String helpMethod()
	{
		return "show_help";
	}
}
