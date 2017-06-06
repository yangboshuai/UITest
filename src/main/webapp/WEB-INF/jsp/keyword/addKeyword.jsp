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
      
    <title>添加关键字</title>  
      
    <script type="text/javascript">  
    function addKeyword(){  
        var form = document.forms[0];  
        form.action = "<%=basePath%>keyword/addKeyword";  
        form.method="post";  
        form.submit();  
    }  
</script>  
  
  </head>  
    
  <body>  
    <h1>添加关键字</h1>  
    <form action="" name="keywordForm">  
     名称：<input type="text" name="name">  
     控件：		<select name="element">
			<c:forEach items="${elementList}" var="element">
				 <option value="${element.name}">${element.name}</option>
			</c:forEach>
		</select>
    	动作：<select id="action" name="action">
			<option value="sendkeys">sendkeys</option>
			<option value="click" selected="selected">click</option>
			<option value="select">select</option>
		</select>
    	是否含有参数：	
    <select id="hasparm" name="hasparm">
		<option value="true" >true</option>
		<option value="false" selected="selected">false</option>
	</select>
       	描述：
		<input type="text" name="description"/> 
		
		<input type="text" name="userId" readonly="readonly" style="display:none" value="${sessionScope.user.id}"> 
        <input type="button" value="添加" onclick="addKeyword()">  
   </form> 
     
    	<a href="<%=basePath%>keyword/getAllKeywords">返回</a>
  </body>  
</html>