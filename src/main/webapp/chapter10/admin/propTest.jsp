<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Properties 활용</title>
</head>
<body>
	<div align="center">
	<h2>Properties 활용</h2>
	<hr />
	<p></p>
	<!-- Listener 기술로 프로젝트 실행시 읽어오는 파일 -->
	버젼 : ${prop.get('version') }<br />
	url : ${prop.get('url') }<br />
	user : ${prop.get('user') }<br />
	password : ${prop.get('passwd') }<br />
	
	<!-- Filter 기술로 인증코드 받을때 -->
	<hr />
	<h2>Admin properties</h2>
	관리자 ID : ${prop.get('adminID') } <br />
	인증번호 : ${auth }
	</div>
</body>
</html>