<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/board/logOut.jsp" method = "post">
		<button type = "submit"> 로그아웃 </button>
	</form>
<form action ="/board/writeLogic.jsp" method ="post">
글제목 :<input type = "text" name ="title"/><br>
글 내용 :<textarea rows="5" cols ="10" name = "content" ></textarea>
<button type ="submit">글 작성하기</button>


</form>

</body>
</html>