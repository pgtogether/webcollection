<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>意见反馈</title>
</head>
<body>
<h1 align="center">意见反馈</h1>
	<table width="715" border="0" align="center">
      <tr>
        <td width="101">意见标题：</td>
        <td width="598"><input type="text" id="ideatitletxt" name="useridea"/></td>
      </tr>
      <tr>
        <td height="76">意见内容</td>
        <td><textarea name="ideacontent" rows="10"  id="ideacontenttxt"></textarea></td>
      </tr>
   
    </table>
	<jsp:include page="/js/dynamic/plugin.js.jsp"></jsp:include>
</body>
<script>
	

</script>
</html>