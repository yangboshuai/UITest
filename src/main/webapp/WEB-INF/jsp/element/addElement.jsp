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
      
    <title>添加控件</title>  
      
    <script type="text/javascript">  
    function addElement(){  
        var form = document.forms[0];  
        form.action = "<%=basePath%>element/addElement";  
        form.method="post";  
        form.submit();  
    }  
	</script>  
  
  </head>  
    
  <body>  
    <h1>添加控件</h1>  
    <form action="" name="elementForm">  
     名称：<input type="text" name="name">  
     属性：
   	<select name="type">
		<option value="id">id</option>
		<option value="name">name</option>
		<option value="xpath">xpath</option>
		<option value="className">className</option>
		<option value="linkText">linkText</option>
		<option value="partialLinkText">partialLinkText</option>
		<option value="cssSelector">cssSelector</option>
	</select>
	
      值：<input type="text" name="typeValue">   
  描述：<input type="text" name="description">   
  
<input type="text" name="userId" style="display:none" value="${sessionScope.user.id}" >   
        <input type="button" value="添加" onclick="addElement()">  
    </form>  
    	<a href="<%=basePath%>element/getAllElements">返回</a>
  </body>  
</html>