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

<title>编辑关键字</title>

<script type="text/javascript">  
    function updateStep(){  
        var form = document.forms[0];  
        form.action = "<%=basePath%>step/updateStep";
		form.method = "post";
		form.submit();
	}
</script>

</head>
<body>
	<h1>编辑关键字</h1>


	<form action="" name="stepForm">
		<input type="hidden" name="id" value="${step.id}" /> 
		步骤编号<input	type="text" name="stepNo" value="${step.stepNo}" /> 
		关键字：<select name="keyword">
			<c:forEach items="${keywordList}" var="keyword">
				 <option <c:if test='${keyword.name == step.keyword}'>selected="selected"</c:if> 
				 value="${keyword.name}">${keyword.name}</option>
			</c:forEach>
		</select>
		 参数：<input type="text" name="parameter" value="${step.parameter}" />
		关联用例编号<input type="hidden" name="caseNo" value="${step.caseNo}" /> 
		<input	type="button" value="保存" onclick="updateStep()" />
	</form>

	<a href="<%=basePath%>step/getCaseSteps?id=${step.caseNo}">返回</a>
</body>

</html>
