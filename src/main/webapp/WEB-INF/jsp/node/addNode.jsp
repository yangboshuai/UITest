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
      
    <title>添加节点</title>  
      
    <script type="text/javascript">  
    function addNode(){  
        var form = document.forms[0];  
        form.action = "<%=basePath%>node/addNode";  
        form.method="post";  
        form.submit();  
    }  
	</script>  
  
  </head>  
    
  <body>  
    <h1>添加节点</h1>  
    <form action="" name="NodeForm">  
     	名称：<input type="text" name="name">  
     	IP地址：<input type="text" name="host">
     	端口号：<input type="text" name="port">  
     	
		  浏览器：
		   	<select name="browser">
				<option value="Chrome">Chrome</option>
				<option value="Firefox">Firefox</option>
				<option value="IE">IE</option>
			</select>
		浏览器路径：<input type="text" name="path">  

		<input type="text" name="userId" style="display:none" value="${sessionScope.user.id}" >   
        <input type="button" value="保存" onclick="addNode()">  
    </form>  
    	<a href="<%=basePath%>node/getAllNodes">返回</a>
  </body>  
</html>