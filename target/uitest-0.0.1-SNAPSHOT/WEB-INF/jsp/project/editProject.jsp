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

<title>编辑项目</title>

<script type="text/javascript">  
    function updateProject(){  
        var form = document.forms[0];  
        form.action = "<%=basePath%>project/updateProject";
		form.method = "post";
		form.submit();
	}
</script>

</head>
<body>
	<h1>编辑项目</h1>


	<form action="" name="projectForm">
		<input type="hidden" name="id" value="${project.id }" /> 
		项目名称：<input type="text" name="name" value="${project.name }" /> 

		  <input type="button" value="编辑" onclick="updateProject()" />
	</form>
	
		<a href="<%=basePath%>project/getAllProjects">返回</a>
</body>

</html>
