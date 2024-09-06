package com.nt.service;

import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nt.model.Books_MToO;
import com.nt.model.Person;
import com.nt.model.User_OToM;
import com.nt.repository.IBookMToORepo;
import com.nt.repository.IUserOToMRepo;

@Service
public class OToMOperationServiceImpl implements IOToMOperationService{
    
	@Autowired
	private IUserOToMRepo userOToMRepo;
	
	@Autowired
	private IBookMToORepo bookMToORepo;

	
	@Override
	public void saveDataUsingUser(User_OToM user,Set<Books_MToO> coursesBought) {
		
		for(Books_MToO book:coursesBought)
		{
			book.setUser(user);
		}
		user.setBooks(coursesBought);
		int id=userOToMRepo.save(user).getUnid();
		System.out.println(id);
	}

	@Override
	public Set<Books_MToO> getDataUsingUser(Integer unid) {
		Optional<User_OToM> opt= userOToMRepo.findById(unid);
		Set<Books_MToO> allBooks=null;
		if(opt.isPresent())
		{
			 allBooks=opt.get().getBooks();
		}
		return allBooks;
		
	}

	@Override
	public void getDataUsingUserButEagerLoading() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<User_OToM> getAllDataUsingUser() {
		List<User_OToM> allList=userOToMRepo.findAll();
		return allList;
	}

}
