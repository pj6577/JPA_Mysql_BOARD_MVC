<%@page import="controller.UserController"%>
<%@page import="model.ReplyDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="controller.ReplyController"%>
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
	int boardId = Integer.parseInt(request.getParameter("id"));
	DBConnector connector = new MYSqlConnector();
	ReplyController replyController = new ReplyController(connector);
	UserController userController = new UserController(connector);
	ArrayList<ReplyDTO> list = replyController.selectAll(boardId);
%>
	<table>
		<%
		for(ReplyDTO r : list ){
		    String nickname = userController.selectOne(r.getWriterId()).getNickname();
		%>

		<tr>
			<td><%=r.getContent() %></td>
			<td><%= nickname %></td>
		</tr>
		<% 
	    }
		%>
	</table>
	<form action="/reply/write.jsp" method="post">
		<input type="hidden" value="<%= boardId %>" name="boardId"> <input
			type="text" name="content">
		<button type="submit">댓글 달기</button>

	</form>


</body>
</html>