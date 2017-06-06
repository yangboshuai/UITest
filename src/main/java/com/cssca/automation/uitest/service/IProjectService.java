package com.cssca.automation.uitest.service;

import java.util.List;

import com.cssca.automation.uitest.entity.Project;


public interface IProjectService {

	boolean addProject(Project project);
	boolean updateProject(Project project);
	boolean deleteProject(Integer id);
	List<Project> getAllProjects();
	Project getProject(Integer id);
}
