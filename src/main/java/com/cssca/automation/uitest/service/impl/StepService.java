package com.cssca.automation.uitest.service.impl;

import java.util.HashMap;
import java.util.List;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.JavascriptExecutor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cssca.automation.uitest.dao.CaseDao;
import com.cssca.automation.uitest.dao.StepDao;
import com.cssca.automation.uitest.entity.Element;
import com.cssca.automation.uitest.entity.Keyword;
import com.cssca.automation.uitest.entity.Result;
import com.cssca.automation.uitest.entity.Step;
import com.cssca.automation.uitest.service.IElementService;
import com.cssca.automation.uitest.service.IFindElementService;
import com.cssca.automation.uitest.service.IKeywordService;
import com.cssca.automation.uitest.service.IResultService;
import com.cssca.automation.uitest.service.IStepService;


@Service
public class StepService implements IStepService {
	
	public static Logger logger=LoggerFactory.getLogger(StepService.class);
		
	@Autowired
	private StepDao stepDao;

	@Autowired
	private CaseDao caseDao;
	
	@Autowired
	private IKeywordService keywordService;

	@Autowired
	private IElementService elementService;

	@Autowired
	private IResultService resultService;

	@Autowired
	private IFindElementService findElementService;
	
	@Override
	public boolean addStep(Step step) {
		// TODO Auto-generated method stub
		return stepDao.addStep(step);
	}

	@Override
	public boolean updateStep(Step step) {
		// TODO Auto-generated method stub
		return stepDao.updateStep(step);
	}

	@Override
	public boolean deleteStep(Integer id) {
		// TODO Auto-generated method stub
		return stepDao.deleteStep(id);
	}

	@Override
	public Step getStepByID(Integer id) {
		// TODO Auto-generated method stub
		return stepDao.getStepByID(id);
	}

	@Override
	public List<Step> getStepByCaseNo(Integer caseNo) {
		// TODO Auto-generated method stub
		return stepDao.getStepByCaseNo(caseNo);
	}

	@Override
	public boolean deleteStepByCaseNo(Integer caseNo) {
		// TODO Auto-generated method stub
		return stepDao.deleteStepByCaseNo(caseNo);
	}

	@Override
	public boolean performStep(Step step,Result result,WebDriver driver) {
		// TODO Auto-generated method stub

		result.pushLog("perform step:" + step.toString());
		
		Keyword kw=null;
		try{
			kw = keywordService.getKeywordByName(step.getKeyword());
			logger.info("find keyword:"+kw.toString());
			result.pushLog("find keyword:"+kw.toString());
		}catch(Exception e){

			logger.info("cann't find keyword:"+kw.toString());
			result.pushLog("cann't find keyword:"+kw.toString());
			return false;
		}
		
		/*
		 * 关键字处理
		 */
		switch (kw.getName()) {
		case "open":
			driver.get(step.getParameter());
			return true;
		case "wait":
			try {
				Thread.sleep(Integer.valueOf(step.getParameter())*1000);
				result.pushLog("wait:"+step.getParameter()+"s");
				logger.info("wait:"+step.getParameter()+"s");
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();				
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return true;
		case "switchToFrame":
			driver.switchTo().frame(step.getParameter());
			return true;
		case "maximize":
			driver.manage().window().maximize();
			return true;
		case "executeJavaScript":
			JavascriptExecutor js=(JavascriptExecutor)driver;
			js.executeScript(step.getParameter());
			return true;
		}
		
		

		Element element = elementService.getElementByName(kw.getElement());

		WebElement webElement;
		try{
			webElement = findElementService.getWebElement(driver,element);
			result.pushLog("find element:"+element.toString());
			logger.info("find element:"+element.toString());
			
		}catch(Exception e){
			
			HashMap<String,String> stepMap = new HashMap<String,String>();
			stepMap.put(step.getStepNo().toString(), "cannot find element:"+element.toString());
			result.errorCases.put(step.getCaseNo().toString(), stepMap);	
		
			result.pushLog("cannot find element:"+element.toString());
			logger.info("cannot find element:"+element.toString());
			
			throw e;
		}
		/*
		 * 动作处理
		 */
		try{
			String action = kw.getAction();
			switch (action) {
			case "sendkeys":
				webElement.sendKeys(step.getParameter());
				result.pushLog("sendkeys:"+step.getParameter());
				break;
			case "click":
				webElement.click();
				break;
			case "select":
				Select sel = new Select(webElement);
				sel.selectByVisibleText(step.getParameter());
				break;
			}
			
		}catch(Exception e){
			
			HashMap<String,String> stepMap = new HashMap<String,String>();
			stepMap.put(step.getStepNo().toString(), "cannot complete the keyword:"+kw.toString());
			result.errorCases.put(step.getCaseNo().toString(), stepMap);	

			logger.info(result.errorCases.toString());
			
			result.pushLog("cannot complete the keyword:"+kw.toString());
			logger.info("cannot complete the keyword:"+kw.toString());
			
			throw e;
		}

		return true;
	}

	@Override
	public boolean exchangeStep(Integer stepId1, Integer stepId2) {
		// TODO Auto-generated method stub
		return stepDao.exchangeStep(stepId1, stepId2);
	}

	@Override
	public boolean checkStep(Step step) {
		// TODO Auto-generated method stub
		
		Keyword keyword =keywordService.getKeywordByName(step.getKeyword());
		if(keyword.getHasparm()){
			if(step.getParameter()==""){
				logger.debug(step.toString());
				return false;
			}
		}
		return true;
	}
	
}
