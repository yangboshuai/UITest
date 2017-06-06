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
	
	public static GoEasy goeasy=new GoEasy("BC-04870854b9bd442d840a65ce574b7c44");
	
	@Override
	public void publishMessage(String message) {
		// TODO Auto-generated method stub
		goeasy.publish("logMessage", dateService.getDate()+" "+message);
	}

	@Override
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
