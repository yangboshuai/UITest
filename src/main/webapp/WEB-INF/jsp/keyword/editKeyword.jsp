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
    function updateKeyword(){  
        var form = document.forms[0];  
        form.action = "<%=basePath%>keyword/editKeyword";
		form.method = "post";
		form.submit();
	}
</script>

</head>
<body>
	<h1>编辑关键字</h1>


	<form action="" name="keywordForm">
		<input type="hidden" name="id" value="${keyword.id}" /> 
		名称：<input type="text" name="name" value="${keyword.name}" /> 
		控件：
		<select name="element">
			<c:forEach items="${elementList}" var="element">
				 <option <c:if test='${element.name == keyword.element}'>selected="selected"</c:if> 
				 value="${element.name}">${element.name}</option>
			</c:forEach>
		</select>
		动作：
		<select id="action" name="action">
			<option value="sendkeys"  <c:if test='${"sendkeys"== keyword.action}'> selected="selected"</c:if> >sendkeys</option>
			<option value="click"  <c:if test='${"click"== keyword.action}'> selected="selected"</c:if> >click</option>
		</select>



		参数： 
		<select id="hasparm" name="hasparm">
			<option value="true"  <c:if test="${"true" == keyword.hasparm}"> selected="selected"</c:if> >true</option>
			<option value="false"  <c:if test="${"false"  == keyword.hasparm}"> selected="selected"</c:if> >false</option>
		</select>

		
		描述：
		<input type="text" name="description" value="${keyword.description}" /> 
		
		<input type="text" name="userId" readonly="readonly" style="display:none" value="${sessionScope.user.id}"> 
		  <input type="button" value="编辑" onclick="updateKeyword()" />
	</form>
	
		<a href="<%=basePath%>keyword/getAllKeywords">返回</a>
</body>

</html>
