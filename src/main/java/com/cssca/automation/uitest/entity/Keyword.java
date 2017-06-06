package com.cssca.automation.uitest.entity;

public class Keyword {

	private Integer id;
	private String name;
	private String element;
	private String action;
	private Boolean hasparm;
	private String description;
	private Integer userId;
	
	public Keyword() {
		super();
	}

	public Keyword(Integer id, String name, String element, String action,
			Boolean hasparm) {
		this.id = id;
		this.name = name;
		this.element = element;
		this.action = action;
		this.hasparm = hasparm;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getElement() {
		return element;
	}

	public void setElement(String element) {
		this.element = element;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public Boolean getHasparm() {
		return hasparm;
	}

	public void setHasparm(Boolean hasparm) {
		this.hasparm = hasparm;
	}

	public String getDescription(){
		return description;
	}
	
	public void setDescription(String description){
		this.description=description;
	}
	
	
	public Integer getUserId(){
		return userId;
	}
	
	public void setUserId(Integer userId){
		this.userId=userId;
	}
	
	@Override  
    public String toString() {  
        return "Keyword [id=" + id + ", name=" + name + ", element=" + element+", action="+ 
        		action +", hasparm="+hasparm+", description=" + description+", userId=" + userId+"]";
    }
	
}
