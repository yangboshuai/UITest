package com.cssca.automation.uitest.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.cssca.automation.uitest.entity.User;
import com.cssca.automation.uitest.service.impl.CaseService;

public class LoginInterceptor implements HandlerInterceptor {
	
	public static Logger logger=LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		// TODO Auto-generated method stub

		  logger.info("this is preHandle of LoginInterceptor");
		  HttpSession session=request.getSession();
		  User user=(User)session.getAttribute("user");

		  
		  if(user==null){

			   logger.info("no user in LoginInterceptor!!!");
			   //request.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(request, response);
			   response.sendRedirect("/UITest");
			   
			   return false;
		  }
		  
		  //返回true代表继续往下执行
		  return true;
	}

}
