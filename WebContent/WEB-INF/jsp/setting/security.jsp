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
				<h2>安全中心</h2>
			</div>
			<div class="main_bd">
				<ul class="safe_list">
					<li class="safe_item">
						<dl>
							<dt class="title">修改登录密码</dt>
							<dd>
								<span class="opr"> <a href="#" id="js_pwd" target="_blank">修改</a>
								</span> 
								<span class="desc"> 用管理员微信扫码验证后，修改你的密码。 </span> 
								<span class="desc" style="display: none;"> 最近操作： &nbsp; 暂无操作记录
								</span>
							</dd>
						</dl>
					</li>
					<li class="safe_item" id="js_admins">
						<dl>
							<dt class="title">设置分类密码</dt>
							<dd>
								<span class="opr"> <a href="${context_path}/setting/security/setcategorypsw">设置</a>
								</span> 
								<span class="desc" style="">您尚未设置分类密码。设置分类密码你可以创建加密分类，可以用来保存私密网址！</span>
							</dd>
						</dl>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="footer">
		<div class="footer-in"></div>
	</div>
	<script src="${context_path}/js/plugin/jquery-1.8.3.min.js"></script>
	<script type="text/javascript">

	</script>
</body>
</html>