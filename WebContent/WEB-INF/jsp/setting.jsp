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
		<div class="set_menu">
			<div class="menu_box" id="menuBar">
				<dl class="menu no_extra">
					<dt class="menu_title">
						<i class="icon_menu"
							style="background: url(
        https://res.wx.qq.com/mpres/htmledition/images/icon/menu/icon_menu_function.png
        ) no-repeat;">
						</i>功能
					</dt>
					<dd class="menu_item ">
						<a href="#">群发功能 </a>
					</dd>
					<dd class="menu_item ">
						<a href="#">群发功能 </a>
					</dd>
					<dd class="menu_item ">
						<a href="#">群发功能 </a>
					</dd>
					<dd class="menu_item ">
						<a href="#">群发功能 </a>
					</dd>
					<dd class="menu_item ">
						<a href="#">群发功能 </a>
					</dd>
				</dl>
				<dl class="menu">
					<dt class="menu_title">
						<i class="icon_menu" style="background:url(
        https://res.wx.qq.com/mpres/htmledition/images/icon/menu/icon_menu_setup.png
        ) no-repeat;">
    </i>功能
					</dt>
					<dd class="menu_item ">
						<a href="#">群发功能 </a>
					</dd>
					<dd class="menu_item ">
						<a href="#">群发功能 </a>
					</dd>
					<dd class="menu_item ">
						<a href="#">群发功能 </a>
					</dd>
					<dd class="menu_item ">
						<a href="#">群发功能 </a>
					</dd>
					<dd class="menu_item ">
						<a href="#">群发功能 </a>
					</dd>
				</dl>
				<dl class="menu">
					<dt class="menu_title">
						<i class="icon_menu"></i>功能
					</dt>
					<dd class="menu_item ">
						<a href="#">群发功能 </a>
					</dd>
					<dd class="menu_item ">
						<a href="#">群发功能 </a>
					</dd>
					<dd class="menu_item ">
						<a href="#">群发功能 </a>
					</dd>
					<dd class="menu_item ">
						<a href="#">群发功能 </a>
					</dd>
					<dd class="menu_item ">
						<a href="#">群发功能 </a>
					</dd>
				</dl>
			</div>
		</div>
		<div class="set_main">
			<div class="main_hd">
			    <h2>自动回复</h2>
			    <div class="title_tab" id="topTab">
			    	<ul class="tab_navs title_tab">
					    <li class="tab_nav first js_top selected" data-id="useradmin">
					    <a href="/cgi-bin/contactmanage?t=user/index&amp;pagesize=10&amp;pageidx=0&amp;type=0&amp;groupid=0&amp;token=1507285931&amp;lang=zh_CN">已关注</a>
					    </li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="footer">
		<div class="footer-in"></div>
	</div>
</body>
</html>