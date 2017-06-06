package com.cssca.automation.uitest.service;

import java.util.List;

import com.cssca.automation.uitest.entity.Result;
import com.cssca.automation.uitest.entity.Step;

public interface IStepService {
	
	boolean addStep(Step step);
	boolean updateStep(Step step);
	boolean deleteStep(Integer id);
	Step getStepByID(Integer id);
	List<Step> getStepByCaseNo(Integer caseNo);
	boolean deleteStepByCaseNo(Integer caseNo);
	boolean performStep(Step step,Result result);
	boolean exchangeStep(Integer stepId1,Integer stepId2);
	boolean checkStep(Step step);
}
