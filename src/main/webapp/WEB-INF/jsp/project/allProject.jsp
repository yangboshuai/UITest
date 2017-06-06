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

<title>控件列表</title>

<script type="text/javascript">  
	
    function del(id){  
        $.get("<%=basePath%>project/deleteProject?id="+ id,function(data){  
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
	<a href="<%=basePath%>project/toAddProject">添加</a>
	<table border="1">
		<tbody>
			<tr>
				<th>编号</th>
				
				<th>项目名称</th>				
				<th>操作</th>	
			</tr>
			<c:if test="${!empty projectList }">
				<c:forEach items="${projectList}" var="project">
					<tr>						
						<td>${project.id }</td>
						<td>${project.name }</td>
						<td><a href="<%=basePath%>project/getProject?id=${project.id}">编辑</a>
							<a href="javascript:del('${project.id}')">删除</a></td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	<a href="<%=basePath%>">返回</a>
</body>
</html>
