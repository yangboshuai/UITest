<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" type="text/css" href="css/mycss.css" >

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript" src="js/jquery.js"></script>


<title>测试结果</title>

<style>
.result {
	color: red;
	font-style: italic;
}
</style>

</head>
<body>

	<script type="text/javascript">
	
	//===================================弹框js部分 start by:songfayuan=========================================  
	//弹出隐藏层  
	function ShowDiv(){  
	    var scrollHeight = document.body.scrollHeight; //文档高度  
	    document.getElementById("fade").style.height=scrollHeight+'px';  
	      
	    document.getElementById("MyDiv").style.display='block';  
	    document.getElementById("fade").style.display='block';  

	};  

	//关闭弹出层  
	function CloseDiv()  
	{  
	    document.getElementById("MyDiv").style.display='none';  
	    document.getElementById("fade").style.display='none';  
	};  
	//===================================弹框js部分 end by:songfayuan=========================================  
		
	function runCase(){
		
    	var caseList=<%=request.getAttribute("caseList")%>;
        var logTest="";
        var timestamp=new Date().getTime();
        
        $.ajax({
        	type:"post",
        	url:"<%=basePath%>startCases?rand="+timestamp,
        	data:{"cases":caseList},
        	success:function(data){
        					document.getElementById("startTime").value=data.startTime;
        					document.getElementById("totalCount").value=data.totalCount;
        					document.getElementById("failedCount").value=data.failedCount;
        					
        					var errorCases=eval('('+data.errorCasesStr+')');
        					var errorMsg="";
        					for(var key in errorCases){

								errorMsg+="错误用例编号："+key+"<br/>";								
								var errorCase=errorCases[key];
								for(var caseKey in errorCase){
									errorMsg+="--->第"+caseKey+"步发生以下错误：<br/><p style='margin-left: 5%;'>"+errorCase[caseKey]+"</p><br/>";
								}
        				    }

        					document.getElementById("errorMsg").innerHTML=errorMsg;
           	    			ShowDiv();
        	    		 }
        });
        
        var timer=window.setInterval(function(){

                    $.ajax({
                    	type:"get",
                    	url:"<%=basePath%>getLog?rand="+timestamp,
                    	success:function(data){
                    		if(data.log!=''){
	                    		logTest=logTest+data.log+"\n"; 
	                    		document.getElementById("log").value=logTest;
                    		}
                    		if(eval(data.isFinished)){
                    			clearInterval(timer);
                    		}
                    	}
                    });

        },100);


    };
    
    window.onload = runCase();
           
    </script>



	<textarea id="log" name="log" rows="30" cols="160"></textarea>


	<!--弹出层时背景层DIV---start-->  
	<div id="fade" class="black_overlay"></div>  
	<div id="MyDiv" class="white_content">
	
	    <div style="text-align: right; cursor: default; margin-top:10px;margin-bottom:10px;">  
	        <span style="font-size: 16px; margin-right: 17px; color: #56BE2D; font-weight: 600;cursor:pointer;"  onclick="CloseDiv('MyDiv','fade')">关闭</span>  
	    </div>  
	    
	    <div style="margin-left: 5%;">  
	        	开始时间：<input type="text" id="startTime" style="border:0;" name="startTime"/>
	        	<br/>
				总测试用例数：<input type="text" id="totalCount" style="border:0;" name="totalCount"/>
				<br/>
				失败测试用例数：<input type="text" id="failedCount" style="border:0;" name="failedCount"/>
				<br/>
				错误信息：
				<p id="errorMsg" style="color:red;font-size:5px;"></p>
				<br/>
	    </div>
	    
	</div>  
	<!--弹出层时背景层DIV---end-->  
	
	<br/>
	<a href="<%=basePath%>testCase/getCasesByUser">返回</a>
	<button onclick="runCase()"> 再次执行</button>
	<button onclick="ShowDiv();"> 查看测试结果</button>
</body>
</html>