package com.cssca.automation.uitest.service.impl;

import java.util.List;

import org.openqa.selenium.WebDriver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cssca.automation.uitest.dao.CaseDao;
import com.cssca.automation.uitest.dao.StepDao;
import com.cssca.automation.uitest.entity.Case;
import com.cssca.automation.uitest.entity.MyDriver;
import com.cssca.automation.uitest.entity.Result;
import com.cssca.automation.uitest.entity.Step;
import com.cssca.automation.uitest.entity.Browser;
import com.cssca.automation.uitest.service.ICaseService;
import com.cssca.automation.uitest.service.IDateService;
import com.cssca.automation.uitest.service.IFindElementService;
import com.cssca.automation.uitest.service.IResultService;
import com.cssca.automation.uitest.service.IStepService;

@Service
public class CaseService implements ICaseService {
	
	
	public static Logger logger=LoggerFactory.getLogger(CaseService.class);
	
	@Autowired
	private StepDao stepDao;
	
	@Autowired
	private CaseDao caseDao;
	
	@Autowired
	private IStepService stepService;
	
	@Autowired
	private IResultService resultService;
	
	@Autowired
	private IFindElementService findElementService;
	
	@Autowired
	private IDateService dateService;
	
	@Override
	public boolean addCase(Case testcase) {
		// TODO Auto-generated method stub
		return caseDao.addCase(testcase);
	}

	@Override
	public boolean updateCase(Case testcase) {
		// TODO Auto-generated method stub
		return caseDao.updateCase(testcase);
	}

	@Override
	public boolean deleteCase(Integer id) {
		// TODO Auto-generated method stub
		List<Step> steps=stepDao.getStepByCaseNo(id);

		if (steps.size() != 0){
			return caseDao.deleteCase(id) && stepDao.deleteStepByCaseNo(id);
		}
		else{
			return caseDao.deleteCase(id);
		}
		
	}

	@Override
	public Case getCaseByID(Integer id) {
		// TODO Auto-generated method stub
		return caseDao.getCaseByID(id);
	}

	@Override
	public List<Case> getAllCases() {
		// TODO Auto-generated method stub
		return caseDao.getAllCases();
	}

	@Override
	public List<Case> getCaseByUser(Integer userId) {
		// TODO Auto-generated method stub
		return caseDao.getCaseByUser(userId);
	}
	
	@SuppressWarnings("static-access")
	@Override
	public boolean runCase(Integer id,Result result) {
		// TODO Auto-generated method stub

		Case testCase=caseDao.getCaseByID(id);
		resultService.publishMessage("run case:"+testCase.getName());
		

		List<Step> steps=stepDao.getStepByCaseNo(id);
		
		MyDriver.driver=findElementService.createWebDriver(Browser.CHROME);
		
		for (Step s : steps){
			try{
				stepService.performStep(s,result);
			}catch(Exception e){
				
				e.printStackTrace();			
				MyDriver.driver.close();
				result.setFailedCount(result.getFailedCount()+1);
				resultService.publishMessage("error message:"+e.getMessage());
				
				return false;
			}

		}
		MyDriver.driver.close();
		

		
		resultService.publishMessage("finished!");
		logger.info("finished!");
		
		logger.info(result.toString());
		return true;
	}

	@Override
	public boolean updateCaseStepNo(Integer caseNo) {
		// TODO Auto-generated method stub
		Integer stepCount=caseDao.getCaseStepCount(caseNo);
		return caseDao.updateCaseStepNo(caseNo,stepCount);
	}

	@Override
	public boolean resortStep(Integer caseNo) {
		// TODO Auto-generated method stub
		List<Step> steps=stepDao.getStepByCaseNo(caseNo);
		Step step;
		for(int i = 0;i < steps.size(); i ++){
			step=steps.get(i);
			step.setStepNo(i+1);
			stepService.updateStep(step);
	    }
		return true;
	}

}
