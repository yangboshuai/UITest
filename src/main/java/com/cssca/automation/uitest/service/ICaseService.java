package com.cssca.automation.uitest.service;

import java.util.List;

import com.cssca.automation.uitest.entity.Case;
import com.cssca.automation.uitest.entity.Result;

public interface ICaseService {
	
	boolean addCase(Case testcase);
	boolean updateCase(Case testcase);
	boolean deleteCase(Integer id);
	Case getCaseByID(Integer id);
	List<Case> getAllCases();
	boolean runCase(Integer id,Result result);
	boolean updateCaseStepNo(Integer caseNo);
	boolean resortStep(Integer caseNo);
	List<Case> getCaseByUser(Integer userId);

}

