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

import com.cssca.automation.uitest.entity.Keyword;
import com.cssca.automation.uitest.entity.User;
import com.cssca.automation.uitest.service.IElementService;
import com.cssca.automation.uitest.service.IKeywordService;

/**
 * ¹¦ÄÜ¸ÅÒª£ºKeywordController
 * 
 * @author Administrator
 * 
 */

@RequestMapping("/keyword")
@Controller
public class KeywordController {

	@Autowired
	private IKeywordService keywordService;
	
	@Autowired
	private IElementService elementService;

	@RequestMapping("/getAllKeywords")
	public String getAllKeywords(HttpServletRequest request) {
		
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		
		List<Keyword> myKeywordsList = keywordService.getMyKeywords(user.getId());
		List<Keyword> othersKeywordsList = keywordService.getOthersKeywords(user.getId());
		
		request.setAttribute("myKeywordsList", myKeywordsList);
		request.setAttribute("othersKeywordsList", othersKeywordsList);
		
		return "/keyword/allKeyword";
	}

	@RequestMapping("/deleteKeyword")
	public void deleteKeyword(int id,HttpServletRequest request,HttpServletResponse response) {

        String result = "{\"result\":\"error\"}";  
        if(keywordService.deleteKeyword(id)){  
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

	@RequestMapping("/getKeyword")
	public String getKeyword(int id, HttpServletRequest request) {
		request.setAttribute("keyword", keywordService.getKeywordByID(id));
		request.setAttribute("elementList", elementService.getAllElements());
		return "/keyword/editKeyword";
	}

	@RequestMapping("/editKeyword")
	public String editKeyword(Keyword keyword, HttpServletRequest request) {
		if (keywordService.updateKeyword(keyword)) {
			//keyword = keywordService.getKeywordByID(keyword.getId());
			//request.setAttribute("keyword", keyword);
			return "redirect:/keyword/getAllKeywords";
		} else {
			System.out.println("Error");
			return "/error";
		}
	}
	
	@RequestMapping("/addKeyword")
	   public String addKeyword(Keyword keyword, HttpServletRequest request){  
		  keywordService.insertKeyword(keyword);		  
		  return "redirect:/keyword/getAllKeywords";
	    }  
	  
	@RequestMapping("/toAddKeyword")
	    public String toAddKeyword(HttpServletRequest request,HttpServletResponse response){  
			request.setAttribute("elementList",elementService.getAllElements() );
	      return "/keyword/addKeyword";
	    }  
}
