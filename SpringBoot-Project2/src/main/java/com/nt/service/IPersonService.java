package com.nt.service;



import java.util.Set;

import com.nt.model.Person;

public interface IPersonService {

	public void savePerson(Person person);
	public Person getAll(Person person);
	public String checkMail(Person person);
	public boolean checkPhone(Person user);
	public void sendInfoToMail(String email,String subject,String body);
	public String generateOTP();
	public String sendPassword(String mail);
	public Set<Person> getAllPerson();
	public boolean checkMailInDatabase(Person person,Set<Person> persons);
	public boolean checkPhoneInDatabase(Person person,Set<Person> persons);
}
