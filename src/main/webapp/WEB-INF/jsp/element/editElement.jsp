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

<title>编辑控件</title>

<script type="text/javascript">  
    function updateElement(){  
        var form = document.forms[0];  
        form.action = "<%=basePath%>element/editElement";
		form.method = "post";
		form.submit();
	}
</script>

</head>
<body>
	<h1>编辑控件</h1>


	<form action="" name="elementForm">
		<input type="hidden" name="id" value="${element.id }" /> 
		名称：<input type="text" name="name" value="${element.name }" /> 
		属性：
		<select name="type">
			<option value="id" <c:if test='${"id"== element.type}'> selected="selected"</c:if>>id</option>
			<option value="name" <c:if test='${"name"== element.type}'> selected="selected"</c:if>>name</option>
			<option value="xpath" <c:if test='${"xpath"== element.type}'> selected="selected"</c:if>>xpath</option>
			<option value="className" <c:if test='${"className"== element.type}'> selected="selected"</c:if>>className</option>
			<option value="linkText" <c:if test='${"linkText"== element.type}'> selected="selected"</c:if>>linkText</option>
			<option value="partialLinkText" <c:if test='${"partialLinkText"== element.type}'> selected="selected"</c:if>>partialLinkText</option>
			<option value="cssSelector" <c:if test='${"cssSelector"== element.type}'> selected="selected"</c:if>>cssSelector</option>
		</select>
		值： <input type="text" name="typeValue" value="${element.typeValue }" /> 
		  描述：<input type="text" name="description" value="${element.description }">   
		<input type="text" name="userId" style="display:none" value="${sessionScope.user.id}" > 
		  <input type="button" value="编辑" onclick="updateElement()" />
	</form>
	
		<a href="<%=basePath%>element/getAllElements">返回</a>
</body>

</html>
