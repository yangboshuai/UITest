package com.cssca.automation.uitest.service;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import com.cssca.automation.uitest.entity.Element;

public interface IFindElementService {
	
	WebElement getWebElement(WebDriver driver,Element element);
	WebElement watiForElement(WebDriver driver,final By by);
	By getBy(String type, String value);


}