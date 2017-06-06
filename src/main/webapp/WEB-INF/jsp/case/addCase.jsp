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
      
    <title>添加用例</title>  
      
    <script type="text/javascript">  
	    function addCase(){  
	        var form = document.forms[0];  
	        form.action = "<%=basePath%>testCase/addCase";  
	        form.method="post";  
	        form.submit();  
	    }  
	</script>  
  
  </head>  
    
  <body>  
    <h1>添加用例</h1>  
    <form action="" name="caseForm">  
     	名称：<input type="text" name="name">  
		测试用例步骤数：	<input type="text" name="stepCount" readonly="readonly" value=0>  
		<input type="text" name="userId" readonly="readonly" style="display:none" value="${sessionScope.user.id}"> 
        <input type="button" value="添加" onclick="addCase()">  
    </form>  
    	<a href="<%=basePath%>testCase/getCasesByUser">返回</a>
  </body>  
</html>