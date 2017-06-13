package com.cssca.automation.uitest.service.impl;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.firefox.FirefoxDriver;
import org.openqa.selenium.ie.InternetExplorerDriver;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cssca.automation.uitest.dao.RunSettingDao;
import com.cssca.automation.uitest.entity.RunSetting;
import com.cssca.automation.uitest.service.IRunSettingService;

@Service
public class RunSettingService implements IRunSettingService {

	@Autowired
	private RunSettingDao runSettingDao;
	
	@Override
	public WebDriver createWebDriver(String browser) {
		// TODO Auto-generated method stub
		
		WebDriver driver;
		switch(browser){
		case "Chrome":
			System.setProperty("webdriver.chrome.driver", "C:\\webDriver\\chromedriver.exe"); 
			driver= new ChromeDriver();
			break;
		case "Firefox":
			driver=  new FirefoxDriver();
			break;
		case "IE":
			driver= new InternetExplorerDriver();
			break;
		default:
			driver=  new InternetExplorerDriver();
			break;
		}
		return driver;
	}

	@Override
	public WebDriver createRemoteWebDriver(String host,String port,String browser,String path) {
		// TODO Auto-generated method stub
		
		WebDriver driver=null;
		
		switch(browser){
		case "Chrome":
			DesiredCapabilities dc = DesiredCapabilities.chrome();
			dc.setCapability("chrome_binary",path);
			try {
				driver=new RemoteWebDriver(new URL("http://"+host+":"+port+"/wd/hub/"),dc);
			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			break;
		case "Firefox":
			driver=  new FirefoxDriver();
			break;
		case "IE":
			driver= new InternetExplorerDriver();
			break;
		default:
			driver=  new InternetExplorerDriver();
			break;
		}
		return driver;
	}

	@Override
	public boolean addRunSetting(RunSetting runSetting) {
		// TODO Auto-generated method stub
		return runSettingDao.addRunSetting(runSetting);
	}

	@Override
	public boolean updateRunSetting(RunSetting runSetting) {
		// TODO Auto-generated method stub
		return runSettingDao.updateRunSetting(runSetting);
	}

	@Override
	public boolean deleteRunSetting(Integer Id) {
		// TODO Auto-generated method stub
		return runSettingDao.deleteRunSetting(Id);
	}

	@Override
	public List<RunSetting> getRunSettings(Integer userId) {
		// TODO Auto-generated method stub
		return runSettingDao.getRunSettings(userId);
	}

	@Override
	public RunSetting getRunSettingById(Integer id) {
		// TODO Auto-generated method stub
		return runSettingDao.getRunSettingByID(id);
	}
}
