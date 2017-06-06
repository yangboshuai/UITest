package com.cssca.automation.uitest.dao;

import java.util.List;

import com.cssca.automation.uitest.entity.Keyword;

public interface KeywordDao {
	
	public Keyword selectKeywordByID(Integer id);
	
	public Keyword getKeywordByName(String name);
	
	public boolean insertKeyword(Keyword keyword);
	
	public boolean deleteKeyword(Integer id);
	
	public boolean updateKeyword(Keyword keyword);
	
	public List<Keyword> getAllKeywords();
	
	public List<Keyword> getMyKeywords(Integer userId);
	
	public List<Keyword> getOthersKeywords(Integer userId);
}
