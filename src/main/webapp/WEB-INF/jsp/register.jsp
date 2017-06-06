<%@ page contentType="text/html; charset=utf-8"  pageEncoding="utf-8"%>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    

<!DOCTYPE html >
<html>
<head>

<script type="text/javascript" src="js/jquery.js"></script>

<meta charset="utf-8">
<title>注册</title>


<script>
	$(function(){
		
		$("#register").click(function(){
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
	            	url:"<%=basePath%>checkNewUser",
	            	data:$('#registerForm').serialize(),
	            	success:function(data){
	               				
	               				if(data.result=="error"){
	               					$('#registerMsg').text(data.msg);
	               				}
	               				else{
	               					alert("注册成功！");
	               					window.location = "<%=basePath%>";
	            	    		}
	            	
	            	}});
	            }
		});
		
		$("#goback").click(function(){
			window.location = "<%=basePath%>";
		});
		
	});
</script>	
	
</head>
<body>
		<form id="registerForm">
			<input type="text" name="name" /><br/><br/>
			<input type="password" name="password" /><br/><br/>
			<p id="registerMsg" class="errorMsg"></p>
			<input type="button" id="register" value="提交" />
			<input type="button" id="goback" value="返回" />
		</form>
</body>
</html>