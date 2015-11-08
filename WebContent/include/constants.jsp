<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String context_path = request.getContextPath();
// 	String basePath = request.getScheme() + "://"
// 			+ request.getServerName() + ":" + request.getServerPort()
// 			+ context_path + "/";
%>
<c:set var="context_path" value="<%=context_path%>" />