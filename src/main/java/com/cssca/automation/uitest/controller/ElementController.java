package com.cssca.automation.uitest.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.cssca.automation.uitest.entity.Element;
import com.cssca.automation.uitest.entity.Project;
import com.cssca.automation.uitest.entity.User;
import com.cssca.automation.uitest.service.IElementService;

/**
 * ¹¦ÄÜ¸ÅÒª£ºElementController
 * 
 * @author Administrator
 * 
 */

@RequestMapping("/element")
@Controller
public class ElementController {

	@Autowired
	private IElementService elementService;

	@RequestMapping("/getAllElements")
	public String getAllElements(HttpServletRequest request) {
		
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		
		List<Element> myElementList = elementService.getMyElements(user.getId());
		
		List<Element> othersElementList = elementService.getOthersElements(user.getId());
		request.setAttribute("myElementList", myElementList);
		request.setAttribute("othersElementList", othersElementList);
		return "/element/allElement";
	}

	@RequestMapping("/deleteElement")
	public void deleteElement(int id,HttpServletRequest request,HttpServletResponse response) {

        String result = "{\"result\":\"error\"}";  
        if(elementService.deleteElement(id)){  
            result = "{\"result\":\"success\"}";  
        }  
        response.setContentType("application/json");  
        try {  
            PrintWriter out = response.getWriter();  
            out.write(result);  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
	}

	@RequestMapping("/getElement")
	public String getElement(int id, HttpServletRequest request) {
		request.setAttribute("element", elementService.getElementByID(id));

		return "/element/editElement";
	}

	@RequestMapping("/editElement")
	public String editElement(Element element, HttpServletRequest request) {
		if (elementService.updateElement(element)) {
			//element = elementService.getElementByID(element.getId());
			//request.setAttribute("element", element);
			return "redirect:/element/getAllElements";
		} else {
			System.out.println("Error");
			return "/error";
		}
	}
	
	@RequestMapping("/addElement")
	   public String addElement(Element element, HttpServletRequest request){  
		  elementService.insertElement(element);
		  return "redirect:/element/getAllElements";
	    }  
	  
	@RequestMapping("/toAddElement")
	    public String toAddElement(Element element,HttpServletRequest request){  

	      return "/element/addElement";
	    }  
}
