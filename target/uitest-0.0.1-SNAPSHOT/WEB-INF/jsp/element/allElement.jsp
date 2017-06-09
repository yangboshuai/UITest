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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<base href="<%=basePath%>">
<script type="text/javascript" src="js/jquery.js"></script>

<title>控件列表</title>

<script type="text/javascript">  
	
    function del(id){
    	
    	
        $.get("<%=basePath%>element/deleteElement?id="+ id,function(data){  
            if("success" == data.result){  
                alert("删除成功");  
                window.location.reload();  
            }else{
                alert("删除失败");  
            }  
        });  
    } 
</script>

</head>

<body>
	<a href="<%=basePath%>element/toAddElement">添加</a>
	<table border="1">
		<tbody>
			<tr>
				<th>编号</th>
				<th>控件名称</th>				
				<th>属性</th>
				<th>值</th>
				<th>描述</th>
				<th>操作</th>

			</tr>
			<c:if test="${!empty myElementList }">
				<c:forEach items="${myElementList}" var="element">
					<tr>
						<td>${element.id }</td>
						<td>${element.name }</td>
						<td>${element.type}</td>
						<td>${element.typeValue}</td>
						<td>${element.description}</td>
						<td><a href="<%=basePath%>element/getElement?id=${element.id}">编辑</a>
							<a href="javascript:del('${element.id}')">删除</a></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${!empty othersElementList }">
				<c:forEach items="${othersElementList}" var="element">
					<tr>
						<td>${element.id }</td>
						<td>${element.name }</td>
						<td>${element.type}</td>
						<td>${element.typeValue}</td>
						<td>${element.description}</td>
						<td></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	<a href="<%=basePath%>home">返回</a>
	<a href="<%=basePath%>keyword/getAllKeywords">前往关键字管理</a>
	<a href="<%=basePath%>testCase/getAllCases">前往测试用例管理</a>
</body>
</html>
