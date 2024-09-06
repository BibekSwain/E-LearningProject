package com.nt.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.nt.model.Person;
import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

@Service
public class SmSSerice {

	     @Value("${twilio.account.sid}")
	    private String accountSid;

	    @Value("${twilio.auth.token}")
	    private String authToken;
	    
	    @Value("${twilio.phone.number}")
	    private String twilioPhoneNumber;
	    
	    public void sendSms(Person person)
	    {
	   
	    try
	    {
	    Twilio.init(accountSid, authToken);
        Message message = Message.creator(
                new PhoneNumber("+91"+person.getPhone()),
                new PhoneNumber(twilioPhoneNumber),
                "Hii you have successfully purchased the courses!Welcome to our Team"
        ).create();
	    }
	    catch(Exception e)
	    {
	    	System.out.println("Invalid phone number");
	    }
	    }
	    
	    
}
