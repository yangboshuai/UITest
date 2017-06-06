package com.cssca.automation.uitest.entity;

import org.openqa.selenium.WebDriver;

public class MyDriver {
	public static WebDriver driver;
	
	public WebDriver getDriver(){
		return driver;
	}
	
	public void setDriver(WebDriver driver){
		this.driver=driver;
	}
}
