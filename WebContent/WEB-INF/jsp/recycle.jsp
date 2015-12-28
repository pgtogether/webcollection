<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/constants.jsp"%>
<jsp:include page="pop.jsp" />
<jsp:include page="templates.jsp" />
<jsp:include page="/js/dynamic/plugin.js.jsp"></jsp:include>
<jsp:include page="/js/dynamic/common.js.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>回收站</title>
<link href="${context_path}/css/base.css" rel="stylesheet"
	type="text/css" />
<link href="${context_path}/css/index.css" rel="stylesheet"
	type="text/css" />
<link href="${context_path}/css/operate.css" rel="stylesheet"
	type="text/css" />
<script src="js/operate.js"></script>
<script src="js/recycle.js"></script>

</head>
<body>
	回收站<br />
   <input type="button" id="back" value="恢复所选"></input>
   <input type="button" id="delete" value="删除所选"></input>
<form id="recyclelist">
 	<input type="button" id="btn1" value="全选">    
   <input type="button" id="btn2" value="取消全选">     
   <input type="button" id="btn4" value="反选">     
   <br/>
</form>
</body>
</html>