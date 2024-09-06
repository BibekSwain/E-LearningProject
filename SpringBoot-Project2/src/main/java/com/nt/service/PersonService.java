package com.nt.service;

import java.util.HashSet;
import java.util.List;
import java.util.Random;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nt.model.Person;
import com.nt.repository.IPersonRepo;
import com.nt.utils.EmailUtils;

@Service
public class PersonService implements IPersonService {

	@Autowired
	private IPersonRepo repoPerson;
	
	@Autowired
	private IPersonService servicePerson;
	
	@Autowired
    private EmailUtils emailUtil;

	@Override
	public void savePerson(Person person) {
		repoPerson.save(person);
		
	}

	@Override
	public Person getAll(Person person) {
		List<Person> allUsersList = repoPerson.findAll(); 
	    Set<Person> allUsers = new HashSet<>(allUsersList);
		for(Person currentUser:allUsers)
		{
			 
		 if (person.getMail().equals(currentUser.getMail()) && person.getPassword().equals(currentUser.getPassword()))
		            return  currentUser;
		}
		
		return null;
	}

	@Override
	public String checkMail(Person person) {
		
		if(!person.getMail().contains("@"))
			return "0";
		else 
	{
        String[] parts=person.getMail().split("@");
        if (parts.length != 2 || parts[1].isEmpty()) {
            return "1";
        }
        else {  
              String beforeAt = parts[0];
              String afterAt = parts[1];
               boolean hasLetter = false;
               boolean hasDigit = false;

               for (char c : beforeAt.toCharArray()) {
                           if (Character.isLetter(c)) {
                                   hasLetter = true;
                         } else if (Character.isDigit(c)) {
                                   hasDigit = true;
                         }
                        if (hasLetter && hasDigit) {
                             break;
                             }
                   }
               if(hasLetter==false||hasDigit==false)
        	       return "2";
		       if(!afterAt.endsWith(".com"))
                  return "3";
		     }
	}
    return "4";
	}

	@Override
	public boolean checkPhone(Person user) {
		char[] digits=user.getPhone().toCharArray();
		for(char c:digits)
		{
		if(!Character.isDigit(c))
		return false;
		}
		return true;
	}

	@Override
	public void sendInfoToMail(String email, String subject, String body) {
		emailUtil.sendEmail(email, subject, body);
		
	}

	@Override
	public String generateOTP() {
		 Random random = new Random();
	        return String.format("%06d", random.nextInt(999999));
	}

	@Override
	public String sendPassword(String mail) {
		List<Person> allList = repoPerson.findAll();
		Set<Person> allSet=new HashSet<Person>(allList);
		for(Person user:allSet)
		{
			if(user.getMail().equals(mail))
			{
				return user.getPassword();
			}
		}
		
		return "ABcdef123";
	}

	@Override
	public Set<Person> getAllPerson() {
		List<Person> lists=repoPerson.findAll();
		Set<Person> allSet=new HashSet<>(lists);
		return allSet;
	}

	@Override
	public boolean checkMailInDatabase(Person person,Set<Person> persons) {
		 int c=0;
		 for(Person person1:persons)
		 {
			 if(person1.getMail().equalsIgnoreCase(person.getMail()))
				 return true;
		 }
		 
		return false;
	}

	@Override
	public boolean checkPhoneInDatabase(Person person,Set<Person> persons) {
		int c=0;
		for(Person person1:persons)
		{
			if(person1.getPhone().equalsIgnoreCase(person.getPhone()))
				return true;
		}
		
		return false;
	}
	
	

}
