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

<title>编辑测试用例</title>

<script type="text/javascript">  
    function updateCase(){  
        var form = document.forms[0];  
        form.action = "<%=basePath%>testCase/updateCase";
		form.method = "post";
		form.submit();
	}
</script>

</head>
<body>
	<h1>编辑测试用例</h1>


	<form name="caseForm">
		<input type="hidden" name="id" value="${testCase.id}" /> 
		名称：<input type="text" name="name" value="${testCase.name}" /> 
		<input type="hidden" name="stepCount" value="${testCase.stepCount}" /> 
		<input type="text" name="userId" readonly="readonly" style="display:none" value="${sessionScope.user.id}"> 
		 <input type="button" value="编辑" onclick="updateCase()" />
	</form>
	
		<a href="<%=basePath%>testCase/getCasesByUser">返回</a>
</body>

</html>
