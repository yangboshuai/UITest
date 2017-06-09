<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>  
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">  
<html>  
  <head>  
    <base href="<%=basePath%>">  
    <script type="text/javascript" src="js/jquery.js"></script>
    <title>添加测试步骤</title>  
      
    <script>  
    $(document).ready(function(){
	    $("#addBtn").click(function(){
	    	var data=$("#stepForm").serialize();
	        $.post("<%=basePath%>step/addStep",
	        		data,
	            	function(data,status){
	            		if(data.result=="success"){
	            			location.href = "<%=basePath%>step/getCaseSteps?id=${Case.id}"
	            		}
	        		});
	    });
    });
	</script> 
  
  </head>  
    
  <body>  
    <h1>添加测试步骤</h1>  
    <form action="" name="stepForm" id="stepForm">  
     步骤编号：<input type="text" name="stepNo" value=${Case.stepCount+1} readonly="readonly">  
		关键字：<select name="keyword">
			<c:forEach items="${keywordList}" var="keyword">
				 <option value="${keyword.name}">${keyword.name}</option>
			</c:forEach>
		</select>
      参数：<input type="text" name="parameter"> 
    关联测试用例编号：<input type="text" name="caseNo" value="${Case.id}" readonly="readonly">
        <input type="button" value="添加" id="addBtn"> 
    </form>  
    	<a href="<%=basePath%>step/getCaseSteps?id=${Case.id}">返回</a>
  </body>  
</html>