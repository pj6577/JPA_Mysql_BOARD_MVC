<%@page import="model.UserDTO"%>
<%@page import="controller.BoardController"%>
<%@page import="connector.MYSqlConnector"%>
<%@page import="connector.DBConnector"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%

DBConnector connector = new MYSqlConnector();
BoardController boardController = new BoardController(connector);
UserDTO logIn = (UserDTO) session.getAttribute("logIn");
	logIn = null;
	response.sendRedirect("/index.jsp");
	
%>
</body>
</html>