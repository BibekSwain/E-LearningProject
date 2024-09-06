package com.nt.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nt.model.CourseDetails;
import com.nt.model.Courses;
import com.nt.model.Notes;
import com.nt.model.Person;
import com.nt.model.User_OToM;
import com.nt.repository.ICoursesRepo;
import com.nt.repository.INotesRepo;
import com.nt.repository.IPersonRepo;
import com.nt.repository.IUserOToMRepo;
import com.nt.service.ICoursesService;
import com.nt.service.IOToMOperationService;
import com.nt.service.IPersonService;

@Controller
public class AdminPageController {
	
	@Autowired
	private IUserOToMRepo repoOToMUser;
	@Autowired
	private ICoursesService courseService;
	
	@Autowired
	private IPersonService personService;
	
	@Autowired
	private IPersonRepo repoPerson;
	
	@Autowired
	private IOToMOperationService userOToMService;
	
	@Autowired
	private INotesRepo repoNotes;
	
	@Autowired
	private   Environment  env;
	
	@Autowired
	private ICoursesRepo repoCourse;
	
	@GetMapping("/adminLogin")
	public String getShowAdmin(Model model) {
		
		model.addAttribute("error", "");
		return "index"; 
	}

	@PostMapping("/adminLogin")
	public String handleAdminLogin(@RequestParam("email") String email,
	                               @RequestParam("password") String password,
	                               Model model) {
		if (email.equals("admin2024@gmail.com") && password.equals("Admin@2024")) {
			model.addAttribute("adminEmail", email);
			return "adminDashboard";
		} else {
			model.addAttribute("error", "Invalid email or password");
			return "index"; 
		}
	}
	
	@GetMapping("/registeredPerson")
	public String showGetRegisteredPerson(Map<String,Object> map)
	{
		Set<Person> personsList=personService.getAllPerson();
		map.put("personsList", personsList);
		return "show_registered_person";
		
	}
	
	@GetMapping("/personPurchased")
	public String showGetPurchasedCourse(Map<String,Object> map)
	{
		List<User_OToM> allPurchasedUser=userOToMService.getAllDataUsingUser();
		Set<User_OToM> allPurchasedUsers=new HashSet<User_OToM>(allPurchasedUser);
		map.put("purchasedUsers", allPurchasedUsers);
		return "show_all_purchased_users";
	}
	
	@GetMapping("/coursesAvailable")
	public String showGetAllCourses(Map<String,Object> map)
	{
		 Set<Courses> coursesSet = courseService.getAllCourses();
		 List<Courses> courses = new ArrayList<>(coursesSet);
		 courses.sort(Comparator.comparing(Courses::getCid));
		map.put("courses", courses);
		return "show_all_courses";
	}
	
	@GetMapping("/addCourse")
	public String getAddCourses(@ModelAttribute("js") CourseDetails  details)
	{
		return "show_uploading_course";
	}
	
	@PostMapping("/addCourse")
	public String postAddCourses(@ModelAttribute("js") CourseDetails  details,RedirectAttributes flash)throws Exception
	{
		String storeLocation=env.getRequiredProperty("upload.store");
	    
	    File  storeLocationFolder=new File(storeLocation);
	    if(!storeLocationFolder.exists())
	    	storeLocationFolder.mkdir(); 
	   
	 
	     MultipartFile   file1=details.getPhotoContent();
	     MultipartFile   file2=details.getPdfContent();
	     
	     InputStream   file1Is=file1.getInputStream();
	     InputStream   file2Is=file2.getInputStream();
	     
	     String fileName1=file1.getOriginalFilename();
	     String fileName2=file2.getOriginalFilename();
	     
	     OutputStream file1Os=new FileOutputStream(storeLocationFolder.getAbsolutePath()+"/"+fileName1);
	     OutputStream file2Os=new FileOutputStream(storeLocationFolder.getAbsolutePath()+"/"+fileName2);
	     
	     IOUtils.copy(file1Is,file1Os);
	     IOUtils.copy(file2Is,file2Os);
	    
	     file1Is.close(); file2Is.close();
	     file1Os.close(); file2Os.close();
	     Courses course=new Courses();
	     course.setCid(details.getId());
	     course.setName(details.getName());
	     course.setPrice(details.getPrice());
	     String  file1Path=(storeLocationFolder.getAbsolutePath()+"/"+fileName1).replace("/","\\");
	     String  file2Path=(storeLocationFolder.getAbsolutePath()+"/"+fileName2).replace("/","\\");
	     course.setPhotoPath(file1Path);
	     course.setPdfPath(file2Path);
	     Notes note=new Notes();
	     note.setVid(details.getId());
	     note.setName(details.getName());
	     note.setPrice(details.getPrice());
	     FileInputStream fis1=new FileInputStream(file1Path);
		  byte[] photoContent=fis1.readAllBytes(); 
		  note.setPhoto(photoContent);
		  FileInputStream fis2=new FileInputStream(file2Path);
		  byte[] pdfContent=fis2.readAllBytes();
		  note.setFileNotes(pdfContent);
	      repoCourse.save(course);
	      repoNotes.save(note);
	      flash.addAttribute("msg", "Correctly uploded");
	     return "redirect:addCourse";
	}
	
	@GetMapping("/deletePerson")
	public String showGetPageDeletePerson(@RequestParam("no") Integer no)
	{
		repoPerson.deleteById(no);
		repoOToMUser.deleteById(no);
		return "forward:registeredPerson";
		
	}
	
	@GetMapping("/deleteCourse")
	public String showGetPageDeleteCourse(@RequestParam("cid") Integer no)
	{
		repoCourse.deleteById(no);
		return "forward:coursesAvailable";
	}
	
	@GetMapping("/editCourse")
	public String showGetPageEditCourse(@RequestParam("cid") Integer no,@ModelAttribute("course") Courses course)
	{
	    Optional<Courses> opt=repoCourse.findById(no);
	    Courses course1=new Courses();
	    if(opt.isPresent())
	    	course1=opt.get();
	    BeanUtils.copyProperties(course1, course);
	    return "show_edit_course";
	    
	}
	
	@PostMapping("/editCourse")
	public String showPostPageEditCourse(@ModelAttribute("course") Courses course,RedirectAttributes flash)
	{
		Courses course2=new Courses();
		Optional<Courses> opt = repoCourse.findById(course.getCid());
		if(opt.isPresent())
			course2=opt.get();
		course2.setName(course.getName());
		course2.setPrice(course.getPrice());
		repoCourse.save(course2);
		flash.addAttribute("msg", "Editable successful");
		return "redirect:coursesAvailable";
	}
}
