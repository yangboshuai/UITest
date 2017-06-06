package com.cssca.automation.uitest.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cssca.automation.uitest.dao.UserDao;
import com.cssca.automation.uitest.entity.User;
import com.cssca.automation.uitest.service.IUserService;

@Service
public class UserService implements IUserService{
	
	@Autowired
	private UserDao userDao;

	@Override
	public boolean addUser(User user) {
		// TODO Auto-generated method stub
		return userDao.addUser(user);
	}

	@Override
	public User getUserByName(String name) {
		// TODO Auto-generated method stub
		
		return userDao.getUserByName(name);
	}

}
