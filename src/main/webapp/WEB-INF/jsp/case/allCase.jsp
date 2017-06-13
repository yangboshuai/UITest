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

<link rel="stylesheet" type="text/css" href="css/mycss.css" >
<script type="text/javascript" src="js/jquery.js"></script>

<title>测试用例管理</title>


    
<script type="text/javascript">  

	//===================================弹框js部分 start by:songfayuan=========================================  
	//弹出隐藏层  
	function ShowDiv(){  
	    var scrollHeight = document.body.scrollHeight; //文档高度  
	    document.getElementById("fade").style.height=scrollHeight+'px';  
	      
	    document.getElementById("MyDiv").style.display='block';  
	    document.getElementById("fade").style.display='block';  
	
	} 
	
	//关闭弹出层  
	function CloseDiv()  
	{  
	    document.getElementById("MyDiv").style.display='none';  
	    document.getElementById("fade").style.display='none';  
	}
	//===================================弹框js部分 end by:songfayuan=========================================  
	
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
	
    function post(URL, param1,param2) {        
        var temp = document.createElement("form");        
        temp.action = URL;        
        temp.method = "post";        
        temp.style.display = "none";        

            var opt = document.createElement("textarea");        
            opt.name = "caseList";        
            opt.value = param1;        
            // alert(opt.name)        
            temp.appendChild(opt);   
            
            var opt2 = document.createElement("textarea");        
            opt2.name = "nodeId";        
            opt2.value = param2;     
            temp.appendChild(opt2);
     
        document.body.appendChild(temp);        
        temp.submit();        
        return temp;        
    } 
    var caseList = [];
    
    function runOneCase(caseID){
    	getNodes();
    	ShowDiv();
    	caseList.push(caseID);
    }
    
    function runMoreCases(){
    	
		var selectCheckboxSize = $("input[name='childCheckBox'][checked='checked']").length;
		if (selectCheckboxSize==0){
			alert("至少选择一个测试用例！");
			return;					
		}
		
		getNodes();
    	ShowDiv();
		var checkboxSize = $("input[name='childCheckBox']").length;					

		for (var a = 0; a < checkboxSize; a++) {

			if ($("input[name='childCheckBox']").eq(a).prop("checked") == true) {
				caseID = $("input[name='childCheckBox']").eq(a).prop("value");
				caseList.push(caseID);
			}
		}
		
    }
    
    function submitRunSetting(){
    	
    	var myForm = document.forms.node;
    	var i;
    	for(i=0;i<myForm.selectedNode.length; i++) {
    	  if(myForm.selectedNode[i].checked) {
    	   break;
    	  }
    	 
    	}
    	 if(i==myForm.selectedNode.length){
    		 alert("至少选择一个节点");
    		 return;
    	 }else{
    		 var nodeId=myForm.selectedNode[i].value;
    	 }
    	
    	post('<%=basePath%>runAllCases',caseList,nodeId); 
    }
    
    function getNodes(){
    	var userId=${sessionScope.user.id};
    	$.ajax({
    			type:"post",
    			url:"<%=basePath%>node/getAllNodes",
    			data:{"userId":userId},
    			});
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
							<a	href="javascript:runOneCase('${testcase.id}')">执行</a>
							</td>
					</tr>
				</c:forEach>
			</c:if>
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td><button id="runMoreCases" onclick="runMoreCases()">执行选中测试用例</button></td>
			</tr>
		</tbody>
	</table>


	<br>
	<a href="<%=basePath%>home">返回</a>
	<a href="<%=basePath%>element/getAllElements">前往控件管理</a>
	<a href="<%=basePath%>keyword/getAllKeywords">前往关键字管理</a>


	<!--弹出层时背景层DIV---start-->  
	<div id="fade" class="black_overlay"></div>  
	<div id="MyDiv" class="node">
	
	    <div style="text-align: right; cursor: default; margin-top:10px;margin-bottom:10px;">  
	        <span style="font-size: 16px; margin-right: 17px; color: #56BE2D; font-weight: 600;cursor:pointer;"  onclick="CloseDiv('MyDiv','fade')">关闭</span>  
	    </div>  

	    <div style="margin-left: 5%;">  
	    	请选择运行测试用例的服务器   
		<form id="node" name="node">
			<table border="1">
				<tbody>
					<tr>
						<th></th>
						<th>编号</th>
						<th>名称</th>
						<th>IP地址</th>
						<th>端口号：</th>
						<th>浏览器</th>
						<th>浏览器路径</th>
					</tr>
					<c:if test="${!empty nodeList }">
					<c:forEach items="${nodeList}" var="node">
						<tr>
							<td><input type="radio" id="selectedNode" name="selectedNode" value="${node.id}" ></td>
							<td>${node.id}</td>
							<td>${node.name}</td>
							<td>${node.host }</td>
							<td>${node.port }</td>
							<td>${node.browser}</td>
							<td>${node.path}</td>
						</tr>
					</c:forEach>
					</c:if>
				</tbody>
			</table>
		</form>
			<br/>
			<input style="margin-left:50%;" type="button" id="submitRunSetting" value="确定" onClick="submitRunSetting()">
	    </div>
	    
	</div>  
	<!--弹出层时背景层DIV---end-->  
</body>
</html>
