<%@page import="model.ReplyDTO"%>
<%@page import="controller.ReplyController"%>
<%@page import="connector.MYSqlConnector"%>
<%@page import="connector.DBConnector"%>
<%@page import="model.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" 
rel="stylesheet" 
integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" 
crossorigin="anonymous">

<title>Insert title here</title>
</head>
<body>
<%

	int boardId = Integer.parseInt(request.getParameter("boardId"));
	String content = request.getParameter("content");
	UserDTO logIn = (UserDTO)session.getAttribute("logIn");
	DBConnector connector = new MYSqlConnector();
	ReplyController replyController = new ReplyController(connector);
	
	ReplyDTO r = new ReplyDTO();
	r.setBoardId(boardId);
	r.setWriterId(logIn.getId());
	r.setContent(content);
	replyController.insert(r);
	
	response.sendRedirect("/board/selectOne.jsp?id=" + boardId);
	
%>

</body>
</html>