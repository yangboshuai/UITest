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
      
    <title>添加项目</title>  
      
    <script type="text/javascript">  
    function addProject(){  
        var form = document.forms[0];  
        form.action = "<%=basePath%>project/addProject";  
        form.method="post";  
        form.submit();  
    }  
</script>  
  
  </head>  
    
  <body>  
    <h1>添加项目</h1>  
    <form action="" name="projectForm">  
     项目名称：<input type="text" name="name">  

        <input type="button" value="添加" onclick="addProject()">  
    </form>  
    	<a href="<%=basePath%>element/getAllElements">返回</a>
  </body>  
</html>