package com.cssca.automation.uitest.entity;

import java.util.List;

public class Case {
	
	private Integer id;
	private String name;
	private List<Step> steps;
	private Integer stepCount;
	private Integer userId;
	
	public Integer getId(){
		return id;
	}
	
	public void setId(Integer id){
		this.id=id;
	}
	
	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name=name;
	}
	
	public List<Step> getSteps(){
		return steps;
	}
	
	public void setSteps(List<Step> steps){
		this.steps=steps;
	}
	
	public Integer getStepCount(){
		return stepCount;
	}
	
	public void setStepCount(Integer stepCount){
		this.stepCount=stepCount;
	}
	
	public Integer getUserId(){
		return userId;
	}
	
	public void setUserId(Integer userId){
		this.userId=userId;
	}
	
	
	@Override  
    public String toString() {  
        return "Case [id=" + id + ", name=" + name + ", steps=" + steps+", stepCount="+ 
        		stepCount +", userId="+userId+"]";
    }
	
}
