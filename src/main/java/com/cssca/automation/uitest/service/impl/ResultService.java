package com.cssca.automation.uitest.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import io.goeasy.GoEasy;

import com.cssca.automation.uitest.dao.ResultDao;
import com.cssca.automation.uitest.entity.Result;
import com.cssca.automation.uitest.entity.Step;
import com.cssca.automation.uitest.service.IDateService;
import com.cssca.automation.uitest.service.IResultService;

@Service
public class ResultService implements IResultService {
	
	@Autowired
	private IDateService dateService;
	
	@Autowired
	private ResultDao resultDao ;

	public boolean addResult(Result result) {
		// TODO Auto-generated method stub
		return resultDao.addResult(result);
	}

	@Override
	public Result getResultById(Integer id) {
		// TODO Auto-generated method stub
		return resultDao.getResultById(id);
	}
	

}
