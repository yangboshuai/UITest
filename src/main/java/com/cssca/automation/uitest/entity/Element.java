package com.cssca.automation.uitest.entity;

/**
 * Element ”≥…‰¿‡
 * @author Administrator
 *
 */

public class Element {
	
	private Integer id;
	private String name;
	private String type;
	private String typeValue;
	private String description;
	private Integer userId;
	
	
	public Element(){
		super();
	};
	
	public Element(Integer id,String name,String type,String typeValue,String description,Integer userId){
		this.id=id;
		this.name=name;
		this.type=type;
		this.typeValue=typeValue;
		this.description=description;
		this.userId=userId;
	}
	
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
	
	
	public String getType(){
		return type;
	}
	
	public void setType(String type){
		this.type=type;
	}
	
	public String getTypeValue(){
		return typeValue;
	}
	
	public void setTypeValue(String typeValue){
		this.typeValue=typeValue;
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
        return "Element [id=" + id + ", name=" + name +", type=" + type + ", typeValue=" + typeValue+
        		", description=" + description+", userId=" + userId+"]";
    }  
	
}
