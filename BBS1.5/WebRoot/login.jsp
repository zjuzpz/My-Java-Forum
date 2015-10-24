<%@page pageEncoding="UTF-8"%>
<%@page import="java.sql.*, java.io.*, com.ucla.bbs.*, java.util.*"%>

<%
//request.setCharacterEncoding("GBK");
String action = request.getParameter("action");
String username = "";
if(action != null && action.trim().equals("login")) {
	username = request.getParameter("username");
	//check if username is valid
	String password = request.getParameter("password");
	//check if username is valid
	if(username == null || password == null || !username.equals("root") || !password.equals("root")){
		out.println("username and password are not matched!");
	} else {
		session.setAttribute("adminLogined", "true");
		response.sendRedirect("articleFlat.jsp");
	}
}
 %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<title>Administrator Login</title>
	</head>
	<body>
	
		<form action="login.jsp" method="post">
			<input type="hidden" name="action" value="login" />
			username:
			<input type="text" name="username" value="<%=username %>"/>
			<br>
			password:
			<input type="password" name="password" />
			<br/>
			<input type="submit" value="login" />
		</form>
	
	</body>
</html>
