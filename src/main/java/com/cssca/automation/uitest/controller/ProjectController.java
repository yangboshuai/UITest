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
import com.cssca.automation.uitest.entity.Project;
import com.cssca.automation.uitest.service.IProjectService;

@Controller
@RequestMapping("/project")
public class ProjectController {

	@Autowired
	private IProjectService projectService;
	
	@RequestMapping("/getAllProjects")
	public String getAllProject(HttpServletRequest request,HttpServletResponse response) {
		List<Project> projects= projectService.getAllProjects();
		request.setAttribute("projectList", projects);
		return "project/allProject";
	}
	
	@RequestMapping("/addProject")
	public String addProject(Project project,HttpServletRequest request,HttpServletResponse response) {
		projectService.addProject(project);
		return "redirect:/project/getAllProjects";
	}
	
	@RequestMapping("/toAddProject")
	public String toAddProject(HttpServletRequest request) {
		return "/project/addProject";
	}
	
	@RequestMapping("/deleteProject")
	public void deleteProject(int id,HttpServletRequest request,HttpServletResponse response ) {
		
        String result = "{\"result\":\"error\"}";  
        if(projectService.deleteProject(id)){  
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
	
	
	@RequestMapping("/getProject")
	public String getProject(int id,HttpServletRequest request) {
		request.setAttribute("project", projectService.getProject(id));
		return "project/editProject";
	}
	
	
	@RequestMapping("/updateProject")
	public String updateProject(Project project,HttpServletRequest request) {
		if(projectService.updateProject(project)){
			return "redirect:/project/getAllProjects";
		}else{
			return "/error";
		}
	}
}
