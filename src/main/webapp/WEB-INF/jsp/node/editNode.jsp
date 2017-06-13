<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>编辑节点</title>

<script type="text/javascript">  
    function updateNode(){  
        var form = document.forms[0];  
        form.action = "<%=basePath%>node/editNode";
		form.method = "post";
		form.submit();
	}
</script>

</head>
<body>
	<h1>编辑节点</h1>


    <form action="" name="NodeForm">  
    	<input type="hidden" name="id" value="${node.id}" /> 
     	名称：<input type="text" name="name" value="${node.name}">  
     	IP地址：<input type="text" name="host" value="${node.host}">
     	端口号：<input type="text" name="port" value="${node.port}">  
     	
		  浏览器：
		   	<select name="browser">
				<option <c:if test='${node.browser=="Chrome"}'>selected="selected"</c:if> 
				 value="Chrome">Chrome</option>
				<option <c:if test='${node.browser =="Firefox"}'>selected="selected"</c:if> 
				 value="Firefox">Firefox</option>
				<option <c:if test='${node.browser =="IE"}'>selected="selected"</c:if> 
				 value="IE">IE</option>
			</select>
		浏览器路径：<input type="text" name="path" value="${node.path}">  

		<input type="text" name="userId" style="display:none" value="${sessionScope.user.id}" >   
        <input type="button" value="保存" onclick="updateNode()">  
    </form>  
	
		<a href="<%=basePath%>node/getAllNodes">返回</a>
</body>

</html>
