package com.cssca.automation.uitest.entity;

import java.util.List;



/**
 * Case ”≥…‰¿‡
 * @author Administrator
 *
 */
public class Suit {
	
	private Integer id;
	private String name;
	private List<Case> steps;
	
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
	
	public List<Case> getSteps(){
		return steps;
	}
	
	public void setSteps(List<Case> steps){
		this.steps=steps;
	}
}
