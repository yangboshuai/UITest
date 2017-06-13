package com.cssca.automation.uitest.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cssca.automation.uitest.entity.Case;
import com.cssca.automation.uitest.entity.RunSetting;
import com.cssca.automation.uitest.entity.Step;
import com.cssca.automation.uitest.entity.User;
import com.cssca.automation.uitest.service.ICaseService;
import com.cssca.automation.uitest.service.IRunSettingService;


@Controller
@RequestMapping("/testCase")
public class CaseController {
	
	@Autowired
	private ICaseService caseService;
	
	@Autowired
	private IRunSettingService runSettingService;
	
	@RequestMapping("/getCase")
	public String getCase(int id,HttpServletRequest request) {
		request.setAttribute("testCase", caseService.getCaseByID(id));
		return "case/editCase";
	}
	
	@RequestMapping("/updateCase")
	public String updateCase(Case testCase,HttpServletRequest request) {
		if(caseService.updateCase(testCase)){
			return "redirect:/testCase/getCasesByUser";
		}else{
			return "/error";
		}
	}
	
	@RequestMapping("/deleteCase")
	public void deleteStep(int id,HttpServletRequest request,HttpServletResponse response ) {
		
        String result = "{\"result\":\"error\"}";  
        if(caseService.deleteCase(id)){  
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
	
	@RequestMapping("/toAddCase")
	public String toAddCase(HttpServletRequest request) {
		return "/case/addCase";
	}

	
	@RequestMapping("/addCase")
	public String addStep(Case testCase,HttpServletRequest request,HttpServletResponse response ) {
		caseService.addCase(testCase);
		return "redirect:/testCase/getCasesByUser";
	}	
	
	@RequestMapping("/getAllCases")
	public String getAllCases(HttpServletRequest request,HttpServletResponse response ) {
		List<Case> cases= caseService.getAllCases();
		request.setAttribute("caseList", cases);
		return "case/allCase";
	}	
	
	@RequestMapping("/getCasesByUser")
	public String getCasesByUser(HttpServletRequest request,HttpServletResponse response) {
		
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		
		List<Case> cases= caseService.getCaseByUser(user.getId());
		List<RunSetting> runSettings=runSettingService.getRunSettings(user.getId());
		
		request.setAttribute("caseList", cases);
		request.setAttribute("nodeList", runSettings);
		
		return "case/allCase";
	}	

}
