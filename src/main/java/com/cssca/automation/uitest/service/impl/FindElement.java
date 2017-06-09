package com.cssca.automation.uitest.service.impl;

import java.net.MalformedURLException;
import java.net.URL;

import org.apache.log4j.Logger;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cssca.automation.uitest.entity.Element;
import com.cssca.automation.uitest.entity.Browser;
import com.cssca.automation.uitest.service.IFindElementService;
import com.cssca.automation.uitest.service.IResultService;

@Service
public class FindElement implements IFindElementService {

	protected static Logger logger=Logger.getLogger(FindElement.class);
	
	WebDriver driver;
	
	@Autowired
	private IResultService resultService;
	
	@Override
	public WebElement getWebElement(Element element) {

		return watiForElement(getBy(element.getType(), element.getTypeValue()));
	}
	
	@Override
	public  WebElement watiForElement(final By by) {

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

	@Override
	public WebDriver createWebDriver(Browser browser) {
		// TODO Auto-generated method stub
		
		
		switch(browser){
		case CHROME:
			System.setProperty("webdriver.chrome.driver", "C:\\webDriver\\chromedriver.exe"); 
			driver= new ChromeDriver();
			break;
		case FIREFOX:
			driver=  new FirefoxDriver();
			break;
		case IE:
			driver= new InternetExplorerDriver();
			break;
		default:
			driver=  new InternetExplorerDriver();
			break;
		}
		return driver;
	}

	@Override
	public WebDriver createRemoteWebDriver(Browser browser) {
		// TODO Auto-generated method stub
		
		
		switch(browser){
		case CHROME:
			DesiredCapabilities dc = DesiredCapabilities.chrome();
			dc.setCapability("chrome_binary","C:\\Program Files (x86)\\Google\\Chrome\\Application\\chrome.exe");
			try {
				driver=new RemoteWebDriver(new URL("http://192.168.169.21:5555/wd/hub/"),dc);
			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case FIREFOX:
			driver=  new FirefoxDriver();
			break;
		case IE:
			driver= new InternetExplorerDriver();
			break;
		default:
			driver=  new InternetExplorerDriver();
			break;
		}
		return driver;
	}



}
