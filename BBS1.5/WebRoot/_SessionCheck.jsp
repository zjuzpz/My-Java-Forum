<!--Check if logged in  -->
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%
boolean logined = false;
String adminLogined = (String)session.getAttribute("adminLogined");
if(adminLogined == null || !adminLogined.equals("true")) {
	response.sendRedirect("login.jsp");
	return;
} 
%>

