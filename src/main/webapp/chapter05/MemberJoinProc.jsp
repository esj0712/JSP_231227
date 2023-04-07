<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member Join</title>
</head>
<body>
	<center>
		<h2>회원 가입</h2>
		<%
		request.setCharacterEncoding("UTF-8");
		%>
		<!-- request로 넘어온 데이터를 자바 bean과 매핑시켜주는 useBean -->
		<!-- 객체생성 MemberBean mbean = new MemberBean(); -->
		<jsp:useBean id="mbean" class="chapter05.MemberBean">
			<!-- jsp(html) 내용을 자바빈 클래스에 데이터를 매핑(setter) -->
			<jsp:setProperty property="*" name="mbean" />
		</jsp:useBean>
		
		<h2>당신의 아이디는 <jsp:getProperty property="id" name="mbean"/></h2>
		<h2>당신의 패스워드는 <jsp:getProperty property="pass" name="mbean"/></h2>
		<h2>당신의 이메일은 <jsp:getProperty property="email" name="mbean"/></h2>
		<h2>당신의 전화번호는 <jsp:getProperty property="phone" name="mbean"/></h2>
		<h2>당신의 주소는 <jsp:getProperty property="address" name="mbean"/></h2>
		<hr />
		<h2>전화번호 : <%= mbean.getPhone() %></h2>
		
	</center>
</body>
</html>