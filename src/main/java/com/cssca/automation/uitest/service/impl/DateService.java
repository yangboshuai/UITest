package com.cssca.automation.uitest.service.impl;

import java.util.Date;
import java.text.SimpleDateFormat;

import org.springframework.stereotype.Service;

import com.cssca.automation.uitest.service.IDateService;

@Service
public class DateService implements IDateService {
	SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

	@Override
	public String getDate() {
		// TODO Auto-generated method stub
		return df.format(new Date());
	}
	
}
