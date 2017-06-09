package com.cssca.automation.uitest.service;

import com.cssca.automation.uitest.entity.Result;

public interface IResultService {

	public boolean addResult(Result result);
	public Result getResultById(Integer id);


}
