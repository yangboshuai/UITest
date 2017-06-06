package com.cssca.automation.uitest.service;

import java.util.List;

import com.cssca.automation.uitest.entity.Keyword;

public interface IKeywordService {
	
	Keyword getKeywordByID(Integer id);
	
	Keyword getKeywordByName(String name);
	
	boolean insertKeyword(Keyword keyword);
	
	boolean updateKeyword(Keyword keyword);
	
	boolean deleteKeyword(Integer id);
	
	List<Keyword> getAllKeywords();

	public List<Keyword> getMyKeywords(Integer userId);
	
	public List<Keyword> getOthersKeywords(Integer userId);
}
