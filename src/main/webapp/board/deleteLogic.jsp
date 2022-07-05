<%@page import="model.UserDTO"%>
<%@page import="model.BoardDTO"%>
<%@page import="controller.BoardController"%>
<%@page import="connector.DBConnector"%>
<%@page import="connector.MYSqlConnector"%>
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
	int id = Integer.parseInt(request.getParameter("id"));
	
	DBConnector connector = new MYSqlConnector();
	BoardController boardController = new BoardController(connector);
	UserDTO logIn = (UserDTO)session.getAttribute("logIn");
	BoardDTO b = boardController.selectOne(id);
	
	if(b == null || b.getWriterId() != logIn.getId()){
	    response.sendRedirect("/board/selectOne.jsp?id=" + id );
	    
	}
	
	boardController.delete(id);
	
	response.sendRedirect("/board/list.jsp");
%>
</body>
</html>