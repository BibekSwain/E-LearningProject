package com.nt.service;

import java.util.List;
import java.util.Set;

import com.nt.model.Books_MToO;
import com.nt.model.Person;
import com.nt.model.User_OToM;

public interface IOToMOperationService {

	public void saveDataUsingUser(User_OToM user,Set<Books_MToO> coursesBought);
    public Set<Books_MToO> getDataUsingUser(Integer unid);
	public void getDataUsingUserButEagerLoading();
	public List<User_OToM> getAllDataUsingUser();
}
