package com.cssca.automation.uitest.service;

import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import com.cssca.automation.uitest.entity.Element;

public interface IElementService {
	
	Element getElementByID(Integer id);
	
	Element getElementByName(String name);
	
	boolean insertElement(Element element);
	
	boolean updateElement(Element element);
	
	boolean deleteElement(Integer id);
	
	List<Element> getAllElements();
	
	List<Element> getMyElements(Integer userId);
	
	List<Element> getOthersElements(Integer userId);
}
