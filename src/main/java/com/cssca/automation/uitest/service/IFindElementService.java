package com.cssca.automation.uitest.service;

import java.net.MalformedURLException;

import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;

import com.cssca.automation.uitest.entity.Browser;
import com.cssca.automation.uitest.entity.Element;

public interface IFindElementService {
	
	WebElement getWebElement(Element element);
	WebElement watiForElement(final By by);
	By getBy(String type, String value);
	WebDriver createWebDriver(Browser browser);
	WebDriver createRemoteWebDriver(Browser browser) throws MalformedURLException;

}