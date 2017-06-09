package com.cssca.automation.uitest.entity;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;

public class Result {
	
	private Integer id;
	private String startTime;
	private Integer totalCount=0;
	private Integer failedCount=0;
	private String errorCasesStr;
	public HashMap<String,HashMap<String,String>> errorCases;
	public LinkedList<String> log =new LinkedList<String>();
	public Boolean isFinished=false;
	
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
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
	public void pushLog(String message){

		message=df.format(new Date())+" "+message;
		log.addFirst(message);
	}
	
	public  String getLog(){
		
		String logMsg="";
		
		try{
			logMsg=log.removeLast();
		}catch(Exception e){
			
		}
		
		return logMsg;
	}
	
	public void clearLog(){
		log.clear();
	}
	
	
	@Override  
    public String toString() {  
        return "Result [id=" + id + ", startTime=" + startTime + ", totalCount=" + totalCount+", failedCount="+ 
        		failedCount +", errorCasesStr="+errorCasesStr+"]";
    }
}
