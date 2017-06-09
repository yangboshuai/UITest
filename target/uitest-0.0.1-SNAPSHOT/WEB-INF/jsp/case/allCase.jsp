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

<title>测试用例管理</title>

<script type="text/javascript">  
	
    function del(id){  
        $.get("<%=basePath%>testCase/deleteCase?id="+ id,function(data){  
            if("success" == data.result){  
                alert("删除成功");
                window.location.reload();  
            }else{
                alert("删除失败");  
            }  
        });  
    }    
	
    function post(URL, PARAMS) {        
        var temp = document.createElement("form");        
        temp.action = URL;        
        temp.method = "post";        
        temp.style.display = "none";        

            var opt = document.createElement("textarea");        
            opt.name = "caseList";        
            opt.value = PARAMS;        
            // alert(opt.name)        
            temp.appendChild(opt);        
     
        document.body.appendChild(temp);        
        temp.submit();        
        return temp;        
    } 
    
    function runCase(caseID){
    	var caseList = [];
    	caseList.push(caseID);
    	post('<%=basePath%>runAllCases',caseList);
    }

	$(function() {
		
		//全选/取消全选
		$('#chkAll').click(
				function() {

					var checkboxSize = $("input[name='childCheckBox']").length;
					if ($(this).attr("checked")) {
						//进行全选操作，比如3个子checkbox
						for (var i = 0; i < checkboxSize; i++) {
							$("input[name='childCheckBox']").eq(i).attr(
									"checked", true);
						}
					} else {
						//取消全选操作，
						for (var a = 0; a < checkboxSize; a++) {
							$("input[name='childCheckBox']").eq(a).attr(
									"checked", false);
						}
					}
				});
		
		//单选
		$("input[name='childCheckBox']").click(
				function() {
						if($(this).attr("checked"))
							$(this).attr("checked",true);
						else
							$(this).removeAttr('checked'); 

					}
				);

		//runbtn action
		$('#runBtn').click(
				function() {
					var selectCheckboxSize = $("input[name='childCheckBox'][checked='checked']").length;
					if (selectCheckboxSize==0){
						alert("至少选择一个测试用例！");
						return;					
					}
					var checkboxSize = $("input[name='childCheckBox']").length;
					var caseList = [];
	
					
					for (var a = 0; a < checkboxSize; a++) {

						if ($("input[name='childCheckBox']").eq(a).prop("checked") == true) {
							caseID = $("input[name='childCheckBox']").eq(a)
									.prop("value");
							caseList.push(caseID);
						}
					}
					
					post('<%=basePath%>runAllCases',caseList);

				})

	});
</script>

</head>

<body>

	<a href="<%=basePath%>testCase/toAddCase">添加</a>
	<table border="1">
		<tbody>
			<tr>
				<th><input id="chkAll" type="checkbox" /></th>

				<th>编号</th>
				<th>用例名称</th>
				<th>用例步骤数</th>
				<th>操作</th>

			</tr>
			<c:if test="${!empty caseList }">
				<c:forEach items="${caseList}" var="testcase">
					<tr>
						<td><input type="checkbox" name="childCheckBox" id="childCheckBox"
							value="${testcase.id}" /></td>
						<td>${testcase.id}</td>
						<td>${testcase.name }</td>
						<td>${testcase.stepCount}</td>
						<td><a href="<%=basePath%>testCase/getCase?id=${testcase.id}">编辑</a>
							<a href="javascript:del('${testcase.id}')">删除</a> <a
							href="<%=basePath%>step/getCaseSteps?id=${testcase.id}">进入</a>
							<a	href="javascript:runCase('${testcase.id}')">执行</a>
							</td>
					</tr>
				</c:forEach>
			</c:if>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><button id="runBtn">执行选中测试用例</button></td>
			</tr>
		</tbody>
	</table>


	<br>
	<a href="<%=basePath%>home">返回</a>
	<a href="<%=basePath%>element/getAllElements">前往控件管理</a>
	<a href="<%=basePath%>keyword/getAllKeywords">前往关键字管理</a>

</body>
</html>
