<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
정말로 삭제 하시겠습니까?
<%
	int id = Integer.parseInt(request.getParameter("id"));

%>

<div onclick ="location.href = '/board/deleteLogic.jsp?id=<%=id %>'" >예</div>
<div onclick ="location.href = '/board/selectOne.jsp?id=<%=id %>'" >아니오</div>
</body>
</html>