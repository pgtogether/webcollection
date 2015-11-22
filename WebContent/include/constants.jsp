<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat,java.util.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String context_path = request.getContextPath();
	String dateStr = new Date().toString();
%>
<c:set var="context_path" value="<%=context_path%>" />
<c:set var="version" value="<%=dateStr%>" />