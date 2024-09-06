package com.nt.controller;

import java.util.Base64;
import java.io.File;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.nt.model.Books_MToO;
import com.nt.model.Courses;
import com.nt.model.Notes;
import com.nt.model.Person;
import com.nt.model.User_OToM;
import com.nt.model.Videos;
import com.nt.repository.IVideoRepo;
import com.nt.service.INotesService;
import com.nt.service.OToMOperationServiceImpl;
import com.nt.service.SmSSerice;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class PersonAndCoursesRelationController {
	
	@Autowired
	private Set<Courses> coursesBought;
	
	@Autowired
	private INotesService notesService;
	
	@Autowired
	private OToMOperationServiceImpl serviceOToMMapping;
	
	@Autowired
	private SmSSerice smsService;
	
	@Autowired
	private IVideoRepo repoVideo;

	@GetMapping("/paymentDashboard")
    public String showPaymentPage(HttpSession session,@ModelAttribute("user")User_OToM user, Model model) {
        Person loginPerson = (Person) session.getAttribute("loginPerson");

        if (loginPerson != null) {
        	model.addAttribute("loginPerson", loginPerson);
        	user.setUnid(loginPerson.getPid());
        	user.setUname(loginPerson.getName());
        	user.setUmail(loginPerson.getMail());
        	user.setUpassword(loginPerson.getPassword());
        	user.setUphone(loginPerson.getPhone());
        	user.setOtp(loginPerson.getOtp());
        	user.setUgender(loginPerson.getGender());
        	 Set<Books_MToO> books = coursesBought.stream()
                     .map(course -> {
                         Books_MToO book = new Books_MToO();
                         book.setBid(course.getCid());
                         book.setBname(course.getName());
                         book.setBprice(course.getPrice());
                         return book;
                     })
                     .collect(Collectors.toSet());
                 serviceOToMMapping.saveDataUsingUser(user, books);
                 model.addAttribute("books",books);
                 for(int i=0;i<150;i++);
        	     smsService.sendSms(loginPerson);
        	     for(int i=0;i<100;i++);
        	    
        	     
        } else {
        	
            return "redirect:login";
        }
        session.removeAttribute("loginPerson");
        coursesBought.clear();
         
        return "show_payment_dashboard";
    }
	
	@GetMapping("/yourDashboard")
	public String showYourDashBoardPage(@RequestParam("pid")Integer unid,Model model)
	{
		Set<Books_MToO> allBooks= serviceOToMMapping.getDataUsingUser(unid);
		List<Integer> bidList = allBooks.stream().map(Books_MToO::getBid).collect(Collectors.toList());
		Set<Notes> notes = notesService.getNotes(bidList);
		
		for (Notes note : notes) {
	        byte[] imageBytes = note.getPhoto(); 
	        if (imageBytes != null) {
	            String base64Image = Base64.getEncoder().encodeToString(imageBytes);
	            note.setBase64Image(base64Image); 
	        }
	    }
		model.addAttribute("notes", notes);
		return "show_your_Dashboard";
		
	}
	
	@GetMapping("/viewNote")
	public ResponseEntity<ByteArrayResource> viewNote(@RequestParam("noteId") Integer noteId) {
	    Optional<Notes> opt = notesService.getNoteById(noteId);
	    if (opt.isPresent()) {
	        Notes note = opt.get();
	        byte[] fileContent = note.getFileNotes();

	        ByteArrayResource resource = new ByteArrayResource(fileContent);

	        return ResponseEntity.ok()
	                .header(HttpHeaders.CONTENT_DISPOSITION, "inline;filename=file.pdf")
	                .contentType(MediaType.APPLICATION_PDF)
	                .body(resource);
	    } else {
	        return ResponseEntity.notFound().build();
	    }
	}
	
	@GetMapping("/displayVideo")
	public String displayVideoGetPage(@RequestParam("id") Integer id,Map<String,Object> map)
	{
		List<Videos> list = repoVideo.findByNid(id);
		map.put("allSection", list);
		return "show_list_video";
		
	}
	
	@GetMapping("/display")
	public String displayVideoContentGetPage(@RequestParam("day")String day,@RequestParam("id") Integer id,Map<String,Object> map, HttpServletRequest req, HttpServletResponse res) throws UnsupportedEncodingException
	{
		Videos video = repoVideo.findByNidAndDays(id,day);
		if (video != null) {
	        String path = video.getVideoPath();
	        File videoFile = new File(path);
	        if (videoFile.exists() && videoFile.canRead()) {
	            map.put("videoPath", req.getContextPath() + "/videos/" + videoFile.getName());
	            System.out.println(req.getContextPath() + "/videos/" + videoFile.getName());
	        } else {
	            map.put("videoPath", null); 
	        }
	     
	    }

		return "show_video";
	}

	
	
	
}
