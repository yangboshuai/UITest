package com.cssca.automation.uitest.dao;

import java.util.List;

import com.cssca.automation.uitest.entity.Element;

public interface ElementDao {
	
	public Element selectElementByID(Integer id);
	
	public Element getElementByName(String name);
	
	public boolean insertElement(Element element);
	
	public boolean deleteElement(Integer id);
	
	public boolean updateElement(Element element);
	
	public List<Element> getAllElements();
	
	List<Element> getMyElements(Integer userId);
	
	List<Element> getOthersElements(Integer userId);
	
}
