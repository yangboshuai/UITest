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

import com.cssca.automation.uitest.entity.RunSetting;
import com.cssca.automation.uitest.entity.User;
import com.cssca.automation.uitest.service.IRunSettingService;

@RequestMapping("/node")
@Controller
public class NodeController {

	@Autowired
	private IRunSettingService runSettingService;

	@RequestMapping("/getAllNodes")
	public String getAllNodes(HttpServletRequest request) {
		
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		
		List<RunSetting> myNodesList = runSettingService.getRunSettings(user.getId());
		
		request.setAttribute("nodeList", myNodesList);
		
		return "/node/allNodes";
	}
	
	@RequestMapping("/deleteNode")
	public void deleteNode(int id,HttpServletRequest request,HttpServletResponse response) {

        String result = "{\"result\":\"error\"}";  
        if(runSettingService.deleteRunSetting(id)){  
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

	@RequestMapping("/getNode")
	public String getNode(int id, HttpServletRequest request) {
		request.setAttribute("node", runSettingService.getRunSettingById(id));
		return "/node/editNode";
	}

	@RequestMapping("/editNode")
	public String editNode(RunSetting runSetting, HttpServletRequest request) {
		if (runSettingService.updateRunSetting(runSetting)) {
			//Node = NodeService.getNodeByID(Node.getId());
			//request.setAttribute("Node", Node);
			return "redirect:/node/getAllNodes";
		} else {
			System.out.println("Error");
			return "/error";
		}
	}
	
	@RequestMapping("/addNode")
	   public String addNode(RunSetting runSetting, HttpServletRequest request){  
			runSettingService.addRunSetting(runSetting);
			
			return "redirect:/node/getAllNodes";
	    }  
	  
	@RequestMapping("/toAddNode")
	    public String toAddNode(HttpServletRequest request,HttpServletResponse response){  

	      return "/node/addNode";
	    }  
	
}
