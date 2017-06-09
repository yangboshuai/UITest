<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<link rel="stylesheet" type="text/css" href="css/mycss.css" >

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>UI自动化测试平台</title>
<script type="text/javascript" src="js/jquery.js"></script>

    
<script>
$(function(){
	 
	$("input[id='projectNo']").click(function(){
		alert($(this).attr("value"));
	});
	 
	});
</script>


</head>
<body>

	<div class="topright">
    <p>当前用户：${sessionScope.user.name}</p>  
    </div>
    
	<div class="center">


	<a href="<%=basePath%>element/getAllElements">控件管理</a>
	<br>
	<a href="<%=basePath%>keyword/getAllKeywords">关键字管理</a>
	<br>
	<a href="<%=basePath%>testCase/getCasesByUser">测试用例管理</a>
	<br>
	<a href="<%=basePath%>logout">退出</a>
	
	</div>
</body>
</html>