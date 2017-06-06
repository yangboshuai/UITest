package com.cssca.automation.uitest.service;

import com.cssca.automation.uitest.entity.User;



public interface IUserService {

	boolean addUser(User user);
	User getUserByName(String name);
	
}
