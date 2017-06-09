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
<script type="text/javascript" src="js/jquery.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>用户登录</title>


    <script type="text/javascript">
    
	    function login(){
	    	
	    	var form = document.forms[0];  
	    	
	    	if(form.name.value==''){
				alert('用户名不能为空！');
				form.name.focus();
				return false;
			}
		
	    	else if(form.password.value==''){
				alert('密码不能为空！');
				form.password.focus();
				return false;
			}
	    	else{
	            $.ajax({
	            	type:"post",
	            	url:"<%=basePath%>checkUser",
	            	data:$('#login').serialize(),
	            	success:function(data){
	               				
	               				if(data.result=="error"){
	               					$('#loginMsg').text(data.msg);
	               				}
	               				else{
	               					window.location = "<%=basePath%>home";
	            	    		}
	            	
	            	}});

	            }
	    }

	    $(document).ready(function(){
			
			$("#register").click(function(){
				window.location = "<%=basePath%>register";
			});
			
		});
</script>
<style>
	.center
	{
	    width: 100px;
	    height: 100px;
	    position: absolute;
	
	    text-align: left;
	
	    left:0;
	    right:0;
	    top: 0;
	    bottom: 0;
	    margin: auto;
	    /*50%为自身尺寸的一半*/
	
	}
	.errorMsg
	{
		color:red;
		font-size:10px;
		width: 200px;
	}
</style>

</head>

<body>
	<div class="center">
		<form id="login">
			<input type="text" name="name" /><br/><br/>
			<input type="password" name="password" /><br/><br/>
			<p id="loginMsg" class="errorMsg"></p>
			<input type="button" value="登录" onclick="login()"/>
			
			<input type="button" id="register" value="注册" />
		</form>
	</div>
</body>
</html>