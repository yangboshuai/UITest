package com.cssca.automation.uitest.service.impl;

import org.apache.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cssca.automation.uitest.entity.Element;
import com.cssca.automation.uitest.service.IFindElementService;
import com.cssca.automation.uitest.service.IResultService;

@Service
public class FindElementService implements IFindElementService {

	protected static Logger logger=Logger.getLogger(FindElementService.class);
	
	
	
	@Autowired
	private IResultService resultService;
	
	@Override
	public WebElement getWebElement(WebDriver driver,Element element) {

		return watiForElement(driver,getBy(element.getType(), element.getTypeValue()));
	}
	
	@Override
	public  WebElement watiForElement(WebDriver driver,final By by) {

		int waitTime = 10;
		WebElement element = null;

		try {

			element = new WebDriverWait(driver, waitTime)
					.until(new ExpectedCondition<WebElement>() {
						public WebElement apply(WebDriver d) {
							return d.findElement(by);
						}
					});

		} catch (Exception e) {

			logger.error(by.toString() + " is not exist until " + waitTime
					+ "s");
			logger.error(e.getMessage());
			throw e;
		}
		return element;
	}
	
	@Override
	public By getBy(String type, String value) {
		By by = null;
		if (type.equals("id")) {
			by = By.id(value);
		}
		if (type.equals("name")) {
			by = By.name(value);
		}
		if (type.equals("xpath")) {
			by = By.xpath(value);

		}
		if (type.equals("className")) {
			by = By.className(value);
		}
		if (type.equals("linkText")) {
			by = By.linkText(value);
		}
		if (type.equals("partialLinkText")) {
			by = By.partialLinkText(value);
			System.out.println(value);
		}
		if (type.equals("cssSelector")) {
			by = By.cssSelector(value);

		}
		return by;
	}


}
