package com.nt.validator;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.nt.model.Person;
import com.nt.repository.IPersonRepo;
import com.nt.service.IPersonService;

@Component
public class PersonValidator implements Validator {

	@Autowired
	private IPersonRepo repoPerson;
	
	@Autowired
	private IPersonService servicePerson;
	
	@Override
	public boolean supports(Class<?> clazz) {
		
		return clazz.isAssignableFrom(Person.class);
	}

	@Override
	public void validate(Object target, Errors errors) {
		
		Person user = (Person) target;
		List<Person> allPersons = repoPerson.findAll();
		Set<Person> persons=new HashSet<Person>(allPersons);
	    // Empty or Blank Input
	    if (user.getName() == null || user.getName().trim().isEmpty()) {
	        errors.rejectValue("name", "user.name.required");
	    }
	    // Email Format Validation
	    
	    if (user.getMail() == null || user.getMail().trim().isEmpty()) {
	        errors.rejectValue("mail", "user.mail.required");
	    }
	    else {
            String result=servicePerson.checkMail(user);
	    	if(result.equals("0"))
	        errors.rejectValue("mail", "user.mail.invalid0");
	    	else if(result.equals("1"))
		        errors.rejectValue("mail", "user.mail.invalid1");
	    	else if(result.equals("2"))
		        errors.rejectValue("mail", "user.mail.invalid2");
	    	else if(result.equals("3"))
		        errors.rejectValue("mail", "user.mail.invalid3");
	    }
	    if(servicePerson.checkMailInDatabase(user,persons)==true)
	    	errors.rejectValue("mail", "user.mail.invalid4");
	    
	    
         //Phone number
	    if (user.getPhone() == null || user.getPhone().trim().isEmpty()) {
	        errors.rejectValue("phone", "user.phone.required");
	    }
	    else if(user.getPhone().length() != 10) {
	        errors.rejectValue("phone", "user.phone.length");
	    }
	    else if(servicePerson.checkPhone(user)==false) {
	    	errors.rejectValue("phone", "user.phone.typeCast");
	    }
	    else if(servicePerson.checkPhoneInDatabase(user, persons)==true) {
	    	errors.rejectValue("phone", "user.phone.invalid");
	    }
	    

        //Gender
	    if (user.getGender().length()==0 || user.getGender().trim().isEmpty()) {
	        errors.rejectValue("gender", "user.gender.required");
	    }


	   

	    // Password Strength
	    if (user.getPassword() ==""||user.getPassword().length()==0) {
	        errors.rejectValue("password", "user.password.required");
	    }
	    else if(user.getPassword().length()<8)
	    {
	    	errors.rejectValue("password", "user.password.length");
	    }

	  
	}

}
