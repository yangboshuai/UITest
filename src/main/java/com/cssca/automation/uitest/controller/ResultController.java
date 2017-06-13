package com.cssca.automation.uitest.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.openqa.selenium.WebDriver;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cssca.automation.uitest.entity.Result;
import com.cssca.automation.uitest.entity.RunSetting;
import com.cssca.automation.uitest.entity.User;
import com.cssca.automation.uitest.service.ICaseService;
import com.cssca.automation.uitest.service.IDateService;
import com.cssca.automation.uitest.service.IResultService;
import com.cssca.automation.uitest.service.IRunSettingService;


@Controller
public class ResultController {

	public static Logger logger = LoggerFactory
			.getLogger(ResultController.class);

	HashMap<String, Result> resultMap = new HashMap<String, Result>();

	@Autowired
	private ICaseService caseService;

	@Autowired
	private IResultService resultService;

	@Autowired
	private IDateService dateService;
	
	@Autowired
	private IRunSettingService runSettingService;

	@RequestMapping("/result")
	public String getResult(int id, HttpServletRequest request) {
		request.setAttribute("testCase", caseService.getCaseByID(id));
		return "/result";
	}

	@RequestMapping("/runAllCases")
	public String getAllResult(String caseList,String nodeId, HttpServletRequest request,
			HttpServletResponse response) {
		
		List<String> cases = Arrays.asList((caseList).split(","));
		
		request.setAttribute("caseList", cases);
		request.setAttribute("nodeId", nodeId);
		
		return "allResult";
	}
	

	@RequestMapping("/startCases")
	public void startCases(String rand,String nodeId, HttpServletRequest request,
			HttpServletResponse response) throws MalformedURLException {
		
		Result result=new Result();
		resultMap.put(rand,result);
		
		String[] cases = request.getParameterValues("cases[]");
		RunSetting runParms=runSettingService.getRunSettingById(Integer.valueOf(nodeId));
		
		result.setTotalCount(cases.length);
		result.setStartTime(dateService.getDate());
		

		for (String testCaseID : cases) {
			try {
				caseService.runCase(Integer.valueOf(testCaseID),result,runParms);
			} catch (NumberFormatException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		JSONObject resultJsonObj = new JSONObject();

		Map map = (Map) result.errorCases;
		Iterator iter = map.keySet().iterator();
		while (iter.hasNext()) {
			String key = (String) iter.next();
			resultJsonObj.put(key, JSONObject.fromObject(map.get(key))
					.toString());
		}

		result.setErrorCasesStr(resultJsonObj.toString());

		resultService.addResult(result);

		response.setContentType("application/json");
		try {
			PrintWriter out = response.getWriter();
			out.write(JSONObject.fromObject(result).toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		result.isFinished=true;
	}

	@RequestMapping("/getLog")
	public void getLog(String rand, HttpServletRequest request,
			HttpServletResponse response) {
		
		Result result=resultMap.get(rand);

		String resultMsg = "{\"isFinished\":\"" + result.isFinished
				+ "\",\"log\":\"" + result.getLog() + "\"}";
		response.setContentType("application/json");
		try {
			PrintWriter out = response.getWriter();
			out.write(resultMsg);
		} catch (IOException e) {
			e.printStackTrace();
		}
		if(result.isFinished){
			resultMap.remove(rand);
		}
	
	}
}
