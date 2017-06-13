package com.cssca.automation.uitest.dao;

import java.util.List;

import com.cssca.automation.uitest.entity.RunSetting;

public interface RunSettingDao {
	
	boolean addRunSetting(RunSetting runSetting);
	boolean updateRunSetting(RunSetting runSetting);
	public boolean deleteRunSetting(Integer Id);
	List<RunSetting> getRunSettings(Integer userId);
	RunSetting getRunSettingByID(Integer id);
	
}
