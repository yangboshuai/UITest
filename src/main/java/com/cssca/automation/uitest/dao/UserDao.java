package com.cssca.automation.uitest.dao;

import com.cssca.automation.uitest.entity.User;

public interface UserDao {
	
	User getUserByName(String name);
	boolean addUser(User user);
}
