<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import ="connector.MYSqlConnector" %>
<%@page import="connector.DBConnector"%>
<%@page import="controller.BoardController"%>
<%@page import="model.UserDTO"%>
<%@page import="java.util.Calendar" %>

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
	UserDTO u = (UserDTO) session.getAttribute("logIn");
	if (u == null) {
	    response.sendRedirect("/index.jsp");
	}

	   DBConnector connector = new MYSqlConnector();

	BoardController boardController = new BoardController(connector);

	ArrayList<BoardDTO> list = boardController.selectAll();
	
	SimpleDateFormat sdf = new SimpleDateFormat("yy-MM-dd");
	
	%>
	<form action="/board/logOut.jsp" method = "post">
		<button type = "submit"> 로그아웃 </button>
	</form>
	<table>
		<tr>
			<th>글 번호</th>
			<th>글 제목</th>
			<th>작성일</th>
			<th>수정일</th>
		</tr>
		<%
		for(BoardDTO b : list){
		%>
		<tr>
			<th><%=b.getId() %></th>
			<th><a href="/board/selectOne.jsp?id=<%=b.getId()%>"><%=b.getTitle() %> </a></th>
			<th><%=sdf.format(b.getWrittenDate().getTime()) %> </th>
			<th><%=sdf.format(b.getUpdatedDate().getTime()) %> </th>
		
		</tr>	
		
		<%
		}
		%>
	</table>
	<div class = "btn_btn_primary" onclick="location.href='/board/write.jsp'">글 작성가기</div>
</body>
</html>









