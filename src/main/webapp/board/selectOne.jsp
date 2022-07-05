<%@page import="controller.UserController"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.BoardDTO"%>
<%@page import="controller.BoardController"%>
<%@page import="connector.MYSqlConnector"%>
<%@page import="connector.DBConnector"%>
<%@page import = "model.UserDTO" %>
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

DBConnector connector = new MYSqlConnector();
BoardController boardController = new BoardController(connector);
BoardDTO b = boardController.selectOne(Integer.parseInt(request.getParameter("id")));
SimpleDateFormat sdf = new SimpleDateFormat("y년 M월 d일 H시 m분 s초");
UserController userController = new UserController(connector);
String nickname = userController.selectOne(b.getWriterId()).getNickname();
%>

	<form action="/board/logOut.jsp" method = "post">
		<button type = "submit"> 로그아웃 </button>
	</form>


<table>
<tr>
	<th>글번호: <%=b.getId() %>  </th>
	</tr>
	<tr>
	<th> 글 제목 : <%=b.getTitle() %></th>
	</tr>
	<tr>
	<th>작성일 : <%= sdf.format(b.getWrittenDate().getTime())%> </th>
	</tr>
	<tr>
	<th>작성자 : <%= nickname %> </th>
	</tr>
	<tr>
	<th>수정일 : <%=sdf.format(b.getUpdatedDate().getTime())%></th>
	</tr>
	<tr>
	<th><%=b.getContent() %> </th>
	</tr>

</table>
<%
	UserDTO logIn = (UserDTO)session.getAttribute("logIn");
	if(b.getWriterId() == logIn.getId()){
	    %>
	    <a href = "/board/update.jsp?id=<%=b.getId() %>">수정하기 </a>
	    <a href = "/board/delete.jsp?id=<%=b.getId() %>">삭제하기 </a>
	    <% 
	}
%>
	<jsp:include page="/reply/list.jsp">
	<jsp:param value="<%=b.getId() %>" name="id"/>
	</jsp:include>
	<br />
	<a href ="/board/list.jsp"> 목록으로</a>

</body>
</html>