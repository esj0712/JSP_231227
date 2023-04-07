<%@page import="chapter05.AddrBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="as" class="chapter05.AddrService" scope="application"/>
<jsp:useBean id="ad" class="chapter05.AddrBean" />
<%
   AddrBean ab=as.getAddr(request.getParameter("sname"));
%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sname</title>
</head>
<body>
<body>
   <div align="center">
      <H2>등록내용</H2>
      이름 : <%=ab.getUsername()%><br>
      전화번호 : <%=ab.getTel()%><br>
      이메일 : <%=ab.getEmail()%><br>
      성별 : <%=ab.getGender()%><br>
      <hr />
      <a href="addr_list.jsp">전체 목록 보기</a>
   </div>
</body>
</html>