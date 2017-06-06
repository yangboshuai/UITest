package com.cssca.automation.uitest.entity;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import net.sf.json.JSONObject;

public class Result {
	
	private Integer id;
	private String startTime;
	private Integer totalCount=0;
	private Integer failedCount=0;
	private String errorCasesStr;
	public HashMap<String,HashMap<String,String>> errorCases;
	
	
	public Result(){
		startTime="";
		totalCount=0;
		failedCount=0;
		errorCases=new HashMap<String,HashMap<String,String>>();
	}
	
	public Integer getId(){
		return id;
	} 
	
	public void setId(Integer id){
		this.id=id;
	}
	
	
	public String getStartTime(){
		return startTime;
	}

	public void setStartTime(String startTime){
		this.startTime=startTime;
	}
	
	public Integer getTotalCount(){
		return totalCount;
	}
	
	public void setTotalCount(Integer totalCount){
		this.totalCount=totalCount;
	}
	
	public Integer getFailedCount(){
		return failedCount;
	}
	
	public void setFailedCount(Integer failedCount){
		this.failedCount=failedCount;
	}
	
	public String getErrorCasesStr(){
		return errorCasesStr;
	}
	
	public void setErrorCasesStr(String errorCasesStr){
		this.errorCasesStr=errorCasesStr;
	}
	

	
	@Override  
    public String toString() {  
        return "Result [id=" + id + ", startTime=" + startTime + ", totalCount=" + totalCount+", failedCount="+ 
        		failedCount +", errorCasesStr="+errorCasesStr+"]";
    }
}
