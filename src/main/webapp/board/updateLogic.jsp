<%@page import="model.BoardDTO"%>
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
	int id = Integer.parseInt(request.getParameter("id"));
	String title = request.getParameter("title");
	String content = request.getParameter("content");

	DBConnector connector = new MYSqlConnector();
	BoardController boardController = new BoardController(connector);

	BoardDTO b = boardController.selectOne(id);
	b.setTitle(title);
	b.setContent(content);

	boardController.update(b);

	response.sendRedirect("/board/selectOne.jsp?id=" + id);
	%>
</body>
</html>