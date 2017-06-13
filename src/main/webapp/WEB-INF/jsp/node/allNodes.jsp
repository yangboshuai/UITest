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

<title>节点列表</title>

<script type="text/javascript">  
	
    function del(id){
    	
    	
        $.get("<%=basePath%>node/deleteNode?id="+ id,function(data){  
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
	<a href="<%=basePath%>node/toAddNode">添加</a>
			<table border="1">
				<tbody>
					<tr>
						<th>编号</th>
						<th>名称</th>
						<th>IP地址</th>
						<th>端口号：</th>
						<th>浏览器</th>
						<th>浏览器路径</th>
						<th>操作</th>
					</tr>
					<c:if test="${!empty nodeList }">
					<c:forEach items="${nodeList}" var="node">
						<tr>
							<td>${node.id}</td>
							<td>${node.name}</td>
							<td>${node.host }</td>
							<td>${node.port }</td>
							<td>${node.browser}</td>
							<td>${node.path}</td>
							<td><a href="<%=basePath%>node/getNode?id=${node.id}">编辑</a>
							<a href="javascript:del('${node.id}')">删除</a></td>
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
