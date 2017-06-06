package com.cssca.automation.uitest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cssca.automation.uitest.entity.Case;



public interface CaseDao {
	
	boolean addCase(Case testcase);
	boolean updateCase(Case testcase);
	public boolean deleteCase(Integer id);
	Case getCaseByID(Integer id);
	public List<Case> getAllCases();
	boolean updateCaseStepNo(@Param("caseNo")Integer caseNo,@Param("stepCount")Integer stepCount);
	Integer getCaseStepCount(@Param("caseNo")Integer id);
	List<Case> getCaseByUser(@Param("userId")Integer userId);

}
