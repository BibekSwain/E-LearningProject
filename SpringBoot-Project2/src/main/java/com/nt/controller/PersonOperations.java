package com.nt.controller;


import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.nt.model.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nt.model.Person;
import com.nt.service.IOToMOperationService;
import com.nt.service.IPersonService;
import com.nt.validator.PersonValidator;

import jakarta.servlet.http.HttpSession;

@Controller
public class PersonOperations {

	@Autowired
	private IPersonService servicePerson;
	
	@Autowired
	private IOToMOperationService userOtoMService;
	
	@Autowired
	private Set<Courses> allCourses;
	
	@Autowired
	private PersonValidator userValidate;
	
	@GetMapping("/")
	public String renderHome() {
		
		return "index";
	}
	
	@GetMapping("/login")
	public String loginGetPage(@ModelAttribute("person") Person person)
	{
		
		return "show_login";
	}
	
	@PostMapping("/login")
	public String loginPostPage(@ModelAttribute("person") Person person,RedirectAttributes attrs,HttpSession session)
	{
		Person result=servicePerson.getAll(person);
		if(result==null)
		{
			attrs.addFlashAttribute("resultMsg", "Invalid Credentials");
			return "redirect:login";
		}
		session.setAttribute("loginPerson",result);
		session.setAttribute("pid", result.getPid());
		System.out.println(result.getPid());
		session.setAttribute("pname", result.getName());
		
		return "dashboard";
	}
	
	@GetMapping("/register")
	public String registerGetPage(@ModelAttribute("person")Person person)
	{
		return "show_register";
	}
	@PostMapping("/register")
	public String registerPostPage(@ModelAttribute("person") Person person,RedirectAttributes attrs,BindingResult errors)
	{
		
		if(userValidate.supports(person.getClass())) {
			 userValidate.validate(person, errors);
			 if(errors.hasErrors()) {
				  return "show_register";
			 }
		}
			 attrs.addFlashAttribute("resultMsg1","Registration is successful");
			 servicePerson.savePerson(person);
			 for(int i=0;i<100;i++);
			 servicePerson.sendInfoToMail(person.getMail(),"Registration is succeessful", "Welcome ,You have successful registered in the application\nYour Password is :"+person.getPassword());
			 return "redirect:login";
		
	}
	
	@ModelAttribute("genderList")
	public  List<String>  populateGender(){
		//use service
		List<String> genderList=Arrays.asList("Male","Female");
		return genderList;
	}
	
	 @GetMapping("/forgotPassword")
	    public String showMailGetPage(Model model) {
	        model.addAttribute("user", new Person());
	        return "show_mail";
	    }

	    @PostMapping("/forgotPassword")
	    public String showMailPostPage(@ModelAttribute("user") Person person, HttpSession session) {
	        System.out.println(person.getMail());
	        String otp = servicePerson.generateOTP();
	        servicePerson.sendInfoToMail(person.getMail(), "One time password", otp);
	        session.setAttribute("otp", otp);
	       String pword= servicePerson.sendPassword(person.getMail());
	       session.setAttribute("pword", pword);
	       session.setAttribute("mail", person.getMail());
	        return "show_Otpverify";
	    }

	    @GetMapping("/submitOtp")
	    public String showOtpPage(Model model) {
	        model.addAttribute("user", new Person());
	        return "show_Otpverify";
	    }

	    @PostMapping("/submitOtp")
	    public String verifyOtp(@ModelAttribute("user") Person person, HttpSession session,RedirectAttributes flash) {
	        String sessionOtp= (String)session.getAttribute("otp");
	        if (person.getOtp().equals(sessionOtp)) {
	            // OTP is correct
	        	session.removeAttribute("otp");
	        	flash.addFlashAttribute("resultMsg2", " One time password is matched correctly and password is sent to your mail id");
	        	String mailId=(String)session.getAttribute("mail");
	        	String pword=(String)session.getAttribute("pword");
	        	servicePerson.sendInfoToMail(mailId, "Your Password", "Dont share your password with anyone:"+pword);
	        	 session.removeAttribute("pword");
	        	 session.removeAttribute("mail");
	            return "redirect:login";
	        }
	        flash.addFlashAttribute("errorMsg", "Enter the correct otp");
	        return "redirect:submitOtp";
	    }
	    
	   

}
