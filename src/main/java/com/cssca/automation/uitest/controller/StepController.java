package com.cssca.automation.uitest.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cssca.automation.uitest.entity.Case;
import com.cssca.automation.uitest.entity.Step;
import com.cssca.automation.uitest.service.ICaseService;
import com.cssca.automation.uitest.service.IKeywordService;
import com.cssca.automation.uitest.service.IStepService;


@Controller
@RequestMapping("/step")
public class StepController {
	
	@Autowired
	private IStepService stepService;
	
	@Autowired
	private IKeywordService keywordService;
	
	@Autowired
	private ICaseService caseService;
	
	@RequestMapping("/getStepByID")
	public String getStep(int id,HttpServletRequest request) {
		request.setAttribute("step", stepService.getStepByID(id));
		request.setAttribute("keywordList",keywordService.getAllKeywords());
		return "/step/editStep";
	}
	
	@RequestMapping("/getCaseSteps")
	public String getCaseSteps(int id,HttpServletRequest request) {
		request.setAttribute("stepList", stepService.getStepByCaseNo(id));
		request.setAttribute("caseNo", id);
		return "/step/caseStep";
	}
	
	@RequestMapping("/updateStep")
	public String updateStep(Step step,HttpServletRequest request) {
		if(stepService.updateStep(step)){
			return "redirect:/step/getCaseSteps?id="+step.getCaseNo();
		}else{
			return "/error";
		}
	}
	
	@RequestMapping("/deleteStep")
	public void deleteStep(int id,HttpServletRequest request,HttpServletResponse response ) {
        String result = "{\"result\":\"error\"}"; 
        
        Step step=stepService.getStepByID(id);
        
        if(stepService.deleteStep(id) && caseService.updateCaseStepNo(step.getCaseNo()) && caseService.resortStep(step.getCaseNo())){

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
	
	@RequestMapping("/addStep")
	public void addStep(Step step,HttpServletRequest request,HttpServletResponse response ) {
		String result;
		if(!stepService.checkStep(step)){
			result = "{\"result\":\"error\",\"msg\":\"the keyword need parameter\"}";
		}
		else{
			stepService.addStep(step);
			caseService.updateCaseStepNo(step.getCaseNo());
			result = "{\"result\":\"success\",\"msg\":\"success\"}";
		}
		
        response.setContentType("application/json");  
        try {  
            PrintWriter out = response.getWriter();  
            out.write(result);  
        } catch (IOException e) {  
            e.printStackTrace();  
        }
	}
	
	@RequestMapping("/toAddStep")
	public String toAddStep(int caseNo,HttpServletRequest request,HttpServletResponse response ) {
		request.setAttribute("Case", caseService.getCaseByID(caseNo));
		request.setAttribute("keywordList",keywordService.getAllKeywords());
		return "/step/addStep";
	}
	
	@RequestMapping("/exchangeStep")
	public void exchangeStep(int stepId1,int stepId2,HttpServletRequest request,HttpServletResponse response ) {
        String result = "{\"result\":\"error\"}";  
        if(stepService.exchangeStep(stepId1,stepId2)){
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

}
