<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Account</title>
</head>
<body>
	<%
		// 한글 깨짐 방지
		request.setCharacterEncoding("UTF-8");
	
		// 아이디 비번 읽어오기
		String id= request.getParameter("id");
		String pw= request.getParameter("pw");
	
	%>
	당신의 id = <%=id %> 이고 패스워드는 <%=pw %>입니다.
</body>
</html>