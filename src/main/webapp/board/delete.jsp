<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
������ ���� �Ͻðڽ��ϱ�?
<%
	int id = Integer.parseInt(request.getParameter("id"));

%>

<div onclick ="location.href = '/board/deleteLogic.jsp?id=<%=id %>'" >��</div>
<div onclick ="location.href = '/board/selectOne.jsp?id=<%=id %>'" >�ƴϿ�</div>
</body>
</html>