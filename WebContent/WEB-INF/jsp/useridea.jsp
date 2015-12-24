<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/constants.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>意见反馈</title>
</head>
<body>
<h1 align="center">意见反馈</h1>
<div align="center">
	<form id="ideaform">
	      
	      意见标题：<input name="ideatitle" type="text" id="ideatitletxt" /><p>
	      <br/>
	        意见内容:<textarea name="ideacontent" rows="10"  id="ideacontenttxt"></textarea>
	     <br/> <input type="button" id="submitbtn" value="提交" />
    </form>
    </div>
	<jsp:include page="/js/dynamic/plugin.js.jsp"></jsp:include>
</body>
<script>

$(function(){
	
	$("#submitbtn").click(function(){
		$.ajax({
			data : $("#ideaform").serialize(),
			type : "post",
			url : "${context_path}/doIdea",
			dataType:"json",
			success : function(json) {
				if(json.msg =="OK"){
					alert("反馈成功");
				}else{
					alert("反馈失败");
				}
			},
			error : function(e) {
				alert(e);
			}
		});
	});
});

</script>
</html>