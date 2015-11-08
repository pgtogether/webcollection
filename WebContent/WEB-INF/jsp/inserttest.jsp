<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/include/constants.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${context_path}/css/base.css" rel="stylesheet"
	type="text/css" />
<link href="${context_path}/css/theme1.css" rel="stylesheet"
	type="text/css" />
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
</head>
<script type="text/javascript">
	$(function() {
		$("#insertBtn").click(function() {
			$.ajax({
				type : "post",
				url : "${context_path}/doInsertTest",
				data : $("#testform").serialize(),
				success : function(json) {
					alert(json);
				},
				error : function() {
				}
			});
		});
	});
</script>
<body>
	<form id="testform">
		<input type="text" id="id" name="id"> <input type="text"
			id="name" name="name"> <input type="button" id="insertBtn"
			value="测试DB">
	</form>
	<div>
		<ul>
			<c:forEach items="${testlist}" var="test">
				<li id="${test.id}">${test.name}</li>
			</c:forEach>
		</ul>
	</div>
</body>
</html>