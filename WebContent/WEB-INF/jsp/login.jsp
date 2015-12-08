<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/constants.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>登录</title>
</head>

<body>
	<div>
	<form id="loginform">
		用户名：<input id="usernametxt" type="text" name="username">
		密码：<input id="pwd" type="password" name="password">
		<input id="loginbtn" type="button" value="提交">
	</form>
	</div>
	<jsp:include page="/js/dynamic/plugin.js.jsp"></jsp:include>
</body>
<script>
    $(function() {
        $('#loginbtn').click(function () {
            if ($('#usernametxt').val() == "" || $('#pwd').val() == "") {
                alert("用户名或密码不能为空！");
            }
            else {
            	$.ajax({
            		type : "post",
            		data: $("#loginform").serialize(), 
            		url: "${context_path}/doLogin",
            		success : function(json) {
            			if(json.result=="OK"){
            				alert("登录成功");
            			}else{
            				alert("用户名或密码错误！");
            			}
            		},
            		error : function(e) {
            			alert("服务器错误！");
            		}
            	});
            }
        });

   });
</script>
</html>