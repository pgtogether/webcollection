<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN">
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/constants.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>Insert title here</title>
<link href="${context_path}/css/base.css" rel="stylesheet"
	type="text/css" />
<link href="${context_path}/css/index.css" rel="stylesheet"
	type="text/css" />
<link href="${context_path}/css/operate.css" rel="stylesheet"
	type="text/css" />
<script src="${context_path}/js/plugin/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	var CONTEXT_PATH = '${context_path}';
</script>
</head>
<body>
	<jsp:include page="/include/head.jsp" />
	<div class="content">
		<jsp:include page="setmenu.jsp" />
		<div class="set_main">
			<div class="main_hd">
				<h2><a href="${context_path}/security">安全中心</a>&nbsp;&gt;&nbsp;设置分类密码</h2>
			</div>
			<div class="main_bd">
				<div class="highlight_box">
					<p class="desc">
						1.为了保证分类密码的安全性，请不要与登录密码设置成一样。<br/>
						2.设置了分类密码，您就可以创建保密分类啦，可以安心的拥有自己的小秘密。
					</p>
				</div>
				<div class="setpsw-box">
					<div class="frm_controls">
						<label class="input-label">分类密码</label>
						<div class="frm_input_box">
							<input type="password" value="" class="frm_input" />
							<p class="frm_msg fail">分类密码不正确</p>
						</div>
					</div>
					<div class="frm_controls">
						<label class="input-label">确认密码</label>
						<div class="frm_input_box">
							<input type="password" value="" class="frm_input" />
							<p class="frm_msg fail">分类密码不正确</p>
						</div>
					</div>
					<div class="frm_controls">
						<div class="frm_submit_box">
							<a class="frm_submit" href="#">提交</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<div class="footer-in"></div>
	</div>
</body>
</html>