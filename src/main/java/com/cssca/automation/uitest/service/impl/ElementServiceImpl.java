package com.cssca.automation.uitest.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;  
import org.springframework.stereotype.Service;  

import com.cssca.automation.uitest.dao.ElementDao;
import com.cssca.automation.uitest.entity.Element;
import com.cssca.automation.uitest.service.IElementService;

@Service
public class ElementServiceImpl implements IElementService{
	@Autowired
	private ElementDao elementDao;
	
	@Override
	public Element getElementByID(Integer id) {  
        return elementDao.selectElementByID(id);           
    }

	@Override
	public Element getElementByName(String name) {
		// TODO Auto-generated method stub
		return elementDao.getElementByName(name);
	}

	@Override
	public boolean insertElement(Element element) {
		// TODO Auto-generated method stub
		return elementDao.insertElement(element);
	}

	@Override
	public boolean deleteElement(Integer id) {
		// TODO Auto-generated method stub
		return elementDao.deleteElement(id);
	}

	@Override
	public List<Element> getAllElements() {
		// TODO Auto-generated method stub
		return elementDao.getAllElements();
	}

	@Override
	public boolean updateElement(Element element) {
		// TODO Auto-generated method stub
		return elementDao.updateElement(element);
	}

	@Override
	public List<Element> getMyElements(Integer userId) {
		// TODO Auto-generated method stub
		return elementDao.getMyElements(userId);
	}

	@Override
	public List<Element> getOthersElements(Integer userId) {
		// TODO Auto-generated method stub
		return elementDao.getOthersElements(userId);
	} 
}
