package com.cssca.automation.uitest.dao;

import com.cssca.automation.uitest.entity.Result;

public interface ResultDao {
	
	public boolean addResult(Result result);
	public Result getResultById(Integer id);
	
}
