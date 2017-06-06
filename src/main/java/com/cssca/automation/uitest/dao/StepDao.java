package com.cssca.automation.uitest.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cssca.automation.uitest.entity.Step;

public interface StepDao {
	boolean addStep(Step step);
	boolean updateStep(Step step);
	boolean deleteStep(Integer id);
	Step getStepByID(Integer id);
	List<Step> getStepByCaseNo(Integer caseNo);
	boolean deleteStepByCaseNo(Integer caseNo);
	boolean exchangeStep(@Param("stepIdone")Integer stepId1,@Param("stepIdtwo")Integer stepId2);
}
