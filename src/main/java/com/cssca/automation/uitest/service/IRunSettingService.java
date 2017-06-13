package com.cssca.automation.uitest.service;

import java.net.MalformedURLException;
import java.util.List;

import org.openqa.selenium.WebDriver;

import com.cssca.automation.uitest.entity.RunSetting;

public interface IRunSettingService {
	
	WebDriver createWebDriver(String browser);
	WebDriver createRemoteWebDriver(String host,String port,String browser,String path) throws MalformedURLException;
	
	boolean addRunSetting(RunSetting runSetting);
	boolean updateRunSetting(RunSetting runSetting);
	public boolean deleteRunSetting(Integer Id);
	List<RunSetting> getRunSettings(Integer userId);
	RunSetting getRunSettingById(Integer id);
}
