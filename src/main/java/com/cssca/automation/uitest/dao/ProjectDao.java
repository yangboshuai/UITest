package com.cssca.automation.uitest.dao;

import java.util.List;

import com.cssca.automation.uitest.entity.Project;

public interface ProjectDao {
	
	boolean addProject(Project project);
	boolean deleteProject(int id);
	boolean updateProject(Project project);
	List<Project> getAllProjects();
	Project getProject(int id);
}
