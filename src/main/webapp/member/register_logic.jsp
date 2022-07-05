<%@page import="model.UserDTO"%>
<%@page import="connector.MYSqlConnector"%>
<%@page import="connector.DBConnector"%>
<%@page import="controller.UserController"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	String username = request.getParameter("username");
	String password = request.getParameter("password");
	String nickname = request.getParameter("nickname");
	
	
	UserDTO u = new UserDTO();
	u.setUsername(username);
	u.setPassword(password);
	u.setNickname(nickname);
	
	DBConnector connector = new MYSqlConnector();
	UserController UserController = new UserController(connector);
	boolean success = UserController.register(u);
	
	if(success){
	    %>
	<jsp:forward page ="/index.jsp" />
	<% 
	} else {
	session.setAttribute("errorMessage", "중복된 아이디입니다");
	%>
	<jsp:forward page ="/member/register.jsp" />
	<%
	}
	%>
	
	
	<%=username%>
	<%=password%>
	<%=nickname%>
</body>
</html>