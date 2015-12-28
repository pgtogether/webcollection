<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/include/constants.jsp"%>
<jsp:include page="/js/dynamic/plugin.js.jsp"></jsp:include>
<jsp:include page="/js/dynamic/common.js.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<script src="js/login.js"></script>
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
</body>
</html>