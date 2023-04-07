<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Page Control</title>
</head>
<body>
	<h2>forward, sendRedirect</h2>
	<hr />
	<form action="response_sendRedirect.jsp" method="post">
		response sendRedirect : <input type="phone" name="tel" >&nbsp;&nbsp;
	   <input type="submit" value="Response">
	</form>
</body>
</html>

<!-- response_sendRedirect() : 처음 클라이언트에서 요청한 url이 아닌 전혀다른 url를 통해 response 된다
즉 상담전화 02-8282-8282 전화했으나 담당부서 2번으로 연결되어 상담요청이 처리되는 것과 같음 -->