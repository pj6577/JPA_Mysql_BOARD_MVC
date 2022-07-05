<%@page import="model.UserDTO"%>
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
	DBConnector connector = new MYSqlConnector();
	BoardController boardController = new BoardController(connector);
	UserDTO logIn = (UserDTO)session.getAttribute("logIn");
	int id = Integer.parseInt(request.getParameter("id"));
	
	BoardDTO b = boardController.selectOne(id);
	if(b == null || b.getWriterId() != logIn.getId()){
	    response.sendRedirect("/board/list.jsp");
	}
	
%>

	<form action = "/board/updateLogic.jsp" method = "post">
	<input type="text" name="title" value="<%=b.getTitle()%>" /> <br />
	<br />
	<input type = "text" name="content" value="<%=b.getContent()%>" /> <br/>
	<input type = "hidden" name = "id" value = "<%=b.getId()%>" />
	<button type = "submit"> 수정하기</button>
	</form>

</body>
</html>