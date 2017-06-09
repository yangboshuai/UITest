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
<script type="text/javascript" src="js/jquery.js"></script>

<title>关键字列表</title>

<script type="text/javascript">  
	
    function del(id){  
        $.get("<%=basePath%>keyword/deleteKeyword?id="+ id,function(data){  
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
	<a href="<%=basePath%>keyword/toAddKeyword">添加</a>
	<table border="1">
		<tbody>
			<tr>
				<th>编号</th>
				<th>关键字名称</th>				
				<th>控件</th>
				<th>动作</th>
				<th>参数</th>
				<th>描述</th>
				<th>操作</th>
			</tr>
			<c:if test="${!empty myKeywordsList }">
				<c:forEach items="${myKeywordsList}" var="keyword">
					<tr>
						<td>${keyword.id }</td>
						<td>${keyword.name }</td>
						<td>${keyword.element}</td>
						<td>${keyword.action}</td>
						<td>${keyword.hasparm}</td>
						<td>${keyword.description}</td>
						<td><a href="<%=basePath%>keyword/getKeyword?id=${keyword.id}">编辑</a>
							<a href="javascript:del('${keyword.id}')">删除</a></td>
					</tr>
				</c:forEach>
			</c:if>
			<c:if test="${!empty othersKeywordsList }">
				<c:forEach items="${othersKeywordsList}" var="keyword">
					<tr>
						<td>${keyword.id }</td>
						<td>${keyword.name }</td>
						<td>${keyword.element}</td>
						<td>${keyword.action}</td>
						<td>${keyword.hasparm}</td>
						<td>${keyword.description}</td>
						<td></td>
					</tr>
				</c:forEach>
			</c:if>			
		</tbody>
	</table>
	<a href="<%=basePath%>home">返回</a>
	<a href="<%=basePath%>element/getAllElements">前往控件管理</a>
	<a href="<%=basePath%>testCase/getAllCases">前往测试用例管理</a>
</body>
</html>
