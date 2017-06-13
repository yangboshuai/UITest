package com.cssca.automation.uitest.entity;

import java.util.HashMap;

public class RunSetting {
	
	public Integer id;
	public String name;
	public String host;
	public String port;
	public String browser;
	public String path;
	public Integer userId;
	
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
	
	public String getHost(){
		return host;
	}

	public void setHost(String host){
		this.host=host;
	}
	
	public String getPort(){
		return port;
	}

	public void setPort(String port){
		this.port=port;
	}
	
	public String getBrowser(){
		return browser;
	}

	public void setBrowser(String browser){
		this.browser=browser;
	}
	
	public String getPath(){
		return path;
	}

	public void setPath(String path){
		this.path=path;
	}
	
	public Integer getUserId(){
		return userId;
	}
	
	public void setUserId(Integer userId){
		this.userId=userId;
	}
	@Override  
    public String toString() {  
        return "RunSetting [id=" + id + ", name=" + name + ", host=" + host+", port="+ 
        		port +", browser="+browser+", path="+path+", userId="+userId+"]";
    }
}
