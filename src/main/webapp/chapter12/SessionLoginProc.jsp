<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SessionLoginProc</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		// request
		String id=request.getParameter("id");
		String pass=request.getParameter("pass");
		
		// session
		session.setAttribute("id", id);
		session.setAttribute("pass", pass);
		
		session.setMaxInactiveInterval(60); // 1분
		
		response.sendRedirect("IncludeTest.jsp");
		
	%>
</body>
</html>