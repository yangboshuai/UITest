package com.cssca.automation.uitest.service.impl;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cssca.automation.uitest.entity.Keyword;
import com.cssca.automation.uitest.service.IKeywordService;
import com.cssca.automation.uitest.service.IResultService;
import com.cssca.automation.uitest.dao.KeywordDao;

@Service
public class KeywordServiceImpl implements IKeywordService {
	
	public static Logger logger=LoggerFactory.getLogger(StepService.class);
	
	@Autowired
	private KeywordDao keywordDao;

	@Autowired
	private IResultService resultService;
	
	@Override
	public Keyword getKeywordByID(Integer id) {
		// TODO Auto-generated method stub
		return keywordDao.selectKeywordByID(id);
	}

	@Override
	public Keyword getKeywordByName(String name) {
		// TODO Auto-generated method stub

		try{
			Keyword keyword=keywordDao.getKeywordByName(name);
			return keyword;
		}catch(Exception e){
			resultService.publishMessage("Cann't find keyword:"+name);
			throw e;
		}
	}

	@Override
	public boolean insertKeyword(Keyword keyword) {
		// TODO Auto-generated method stub
		return keywordDao.insertKeyword(keyword);
	}

	@Override
	public boolean updateKeyword(Keyword keyword) {
		// TODO Auto-generated method stub
		return keywordDao.updateKeyword(keyword);
	}

	@Override
	public boolean deleteKeyword(Integer id) {
		// TODO Auto-generated method stub
		return keywordDao.deleteKeyword(id);
	}

	@Override
	public List<Keyword> getAllKeywords() {
		// TODO Auto-generated method stub
		return keywordDao.getAllKeywords();
	}

	@Override
	public List<Keyword> getMyKeywords(Integer userId) {
		// TODO Auto-generated method stub
		return keywordDao.getMyKeywords(userId);
	}

	@Override
	public List<Keyword> getOthersKeywords(Integer userId) {
		// TODO Auto-generated method stub
		return keywordDao.getOthersKeywords(userId);
	}


}
