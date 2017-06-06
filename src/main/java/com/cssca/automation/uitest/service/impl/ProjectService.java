package com.cssca.automation.uitest.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cssca.automation.uitest.dao.ProjectDao;
import com.cssca.automation.uitest.entity.Project;
import com.cssca.automation.uitest.service.IProjectService;


@Service
public class ProjectService implements IProjectService {

	@Autowired
	private ProjectDao projectDao;
	
	@Override
	public boolean addProject(Project project) {
		// TODO Auto-generated method stub
		
		return projectDao.addProject(project);
	}

	@Override
	public boolean updateProject(Project project) {
		// TODO Auto-generated method stub
		return projectDao.updateProject(project);
	}

	@Override
	public boolean deleteProject(Integer id) {
		// TODO Auto-generated method stub
		return projectDao.deleteProject(id);
	}

	@Override
	public List<Project> getAllProjects() {
		// TODO Auto-generated method stub
		List<Project> projectList=projectDao.getAllProjects();
		return projectList;
	}

	@Override
	public Project getProject(Integer id) {
		// TODO Auto-generated method stub
		Project project= projectDao.getProject(id);
		return project;
	}

}
