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

<title>步骤管理</title>

<script type="text/javascript">  
	
    function del(id){  
        $.get("<%=basePath%>step/deleteStep?id="+ id,function(data){  
            if("success" == data.result){  
                alert("删除成功");
                window.location.reload();  
            }else{
                alert("删除失败");  
            }  
        });  
    } 
</script>

<script>
$(function(){ 
    //上移 
    var $up = $(".up") 
    $up.click(function() {
    	
    	var mystepID=$(this).parents("tr").children("#stepID").text();
    	var myupID=$(this).parents("tr").prev().children("#stepID").text();
    	
    	$.post("<%=basePath%>step/exchangeStep",{stepId1:mystepID,stepId2:myupID},function(data){
//             alert(data.result);
        });
    	
    	
        var $tr = $(this).parents("tr"); 
        if ($tr.index() != 1) { 
            $tr.fadeOut().fadeIn(); 
            $tr.prev().before($tr); 
        }
    }); 
    //下移 
    var $down = $(".down"); 
    var len = $down.length; 

    $down.click(function() { 
    	
    	var mystepID=$(this).parents("tr").children("#stepID").text();
    	var mydownID=$(this).parents("tr").next().children("#stepID").text();
    	
    	$.post("<%=basePath%>step/exchangeStep",{stepId1:mystepID,stepId2:mydownID},function(data){
//             alert(data.result);
        });
    	
        var $tr = $(this).parents("tr"); 
        if ($tr.index() != len) { 
            $tr.fadeOut().fadeIn(); 
            $tr.next().after($tr); 
        }
    }); 
    
}); 






</script>

</head>

<body>
	<a href="<%=basePath%>step/toAddStep?caseNo=${caseNo}">添加</a>
	<table border="1" class="table">
		<tbody>
			<tr>
				
<!-- 				<th style="display:none;">编号</th> -->
				<th>编号</th>
				<th>步骤编号</th>
				<th>关键字</th>				
				<th>值</th>
				<th >关联用例号</th>
				<th >操作</th>
			</tr>
			<c:if test="${!empty stepList }">
				<c:forEach items="${stepList}" var="step">
					<tr>
<%-- 						<td style="display:none;" id="stepID">${step.id }</td> --%>
						<td id="stepID">${step.id }</td>
						<td>${step.stepNo }</td>
						<td>${step.keyword}</td>
						<td>${step.parameter}</td>
						<td>${step.caseNo}</td>
						<td><a href="<%=basePath%>step/getStepByID?id=${step.id}">编辑</a>
							<a href="javascript:del('${step.id}')">删除</a>
							<a class="up">上移</a>
							<a class="down">下移</a>
							</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	</table>
	<a href="<%=basePath%>testCase/getCasesByUser">返回</a>
	<a href="<%=basePath%>step/getCaseSteps?id=${caseNo}">刷新</a>
	<a href="<%=basePath%>result?id=${caseNo}">执行</a>
	
	<a href="<%=basePath%>keyword/getAllKeywords">前往关键字管理</a>
	<a href="<%=basePath%>element/getAllElements">前往控件管理</a>
</body>
</html>
