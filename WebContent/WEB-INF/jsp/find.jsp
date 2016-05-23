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
<link href="${context_path}/css/common.css" rel="stylesheet"
	type="text/css" />
<link href="${context_path}/css/find.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<jsp:include page="/include/head.jsp" />
	<div class="content search-content">
		<div class="search-box">
			<div class="search-input">
				<input type="text" /><span class="btn"></span>
			</div>
			<div class="history">
				<ul>
					<li><a>asd</a></li>
					<li><a>asd</a></li>
					<li><a>asd</a></li>
					<li><a>asd</a></li>
					<li><a>asd</a></li>
				</ul>
			</div>
		</div>
	</div>
	<jsp:include page="/include/footer.jsp" />
</body>
</html>