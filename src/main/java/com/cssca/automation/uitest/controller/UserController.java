package com.cssca.automation.uitest.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.jms.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.cssca.automation.uitest.entity.User;
import com.cssca.automation.uitest.service.IUserService;

@Controller
public class UserController {

	public static Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private IUserService userService;

	@RequestMapping("/")
	public String login() {

		return "login";
	}

	@RequestMapping("/checkUser")
	public void checkUser(User user, HttpServletRequest request,
			HttpServletResponse response,HttpSession session) {

		User userInDatabase = userService.getUserByName(user.getName());

		String result = "{\"result\":\"success\",\"msg\":\"login success\"}";

		response.setContentType("application/json");

		if (user.getName() == null)
			result = "{\"result\":\"error\",\"msg\":\"username can't be null\"}";
		else if (user.getPassword() == null)
			result = "{\"result\":\"error\",\"msg\":\"password can't be null\"}";
		else if (userInDatabase == null)
			result = "{\"result\":\"error\",\"msg\":\"username doesn't exist\"}";
		else if (!(userInDatabase.getPassword().equals(user.getPassword())))
			result = "{\"result\":\"error\",\"msg\":\"password is wrong\"}";
		else {
			session.setAttribute("user", userInDatabase);
			} 

		try {
			PrintWriter out = response.getWriter();
			out.write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/home")
	public String home() {
		return "home";
	}

	@RequestMapping("/register")
	public String register() {
		return "register";
	}
	
	@RequestMapping("/checkNewUser")
	public void checkNewUser(User user, HttpServletRequest request,
			HttpServletResponse response,HttpSession session) {

		User userInDatabase = userService.getUserByName(user.getName());

		String result = "{\"result\":\"success\",\"msg\":\"register success\"}";

		response.setContentType("application/json");

		if (user.getName() == null)
			result = "{\"result\":\"error\",\"msg\":\"username can't be null\"}";
		else if (user.getPassword() == null)
			result = "{\"result\":\"error\",\"msg\":\"password can't be null\"}";
		else if (userInDatabase != null)
			result = "{\"result\":\"error\",\"msg\":\"username has existed\"}";
		else{
			userService.addUser(user);
		}

		try {
			PrintWriter out = response.getWriter();
			out.write(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("/logout")
	public String login(HttpSession session) {
		session.invalidate();
		return "login";
	}
}
