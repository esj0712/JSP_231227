<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
 //한글깨짐
 request.setCharacterEncoding("UTF-8");
 //username으로 넘어온 값 받아오기
 String username = request.getParameter("username");
 //session영역에 값을 저장
 if(username !=null){
	 session.setAttribute("user", username);
 }

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>twitter_list</title>
</head>
<body>
	<div align="center">
		<h3>My Twitter</h3>
		<hr />
		<form action="tweet.jsp" method="post">
			<!-- 세션 영역에 저장된 이름 출력 -->
			<%= session.getAttribute("user") %>
			[메세지] : <input type="text" name="msg"> 
			<input type="submit" value="Tweet">
		</form>
		<hr />
		<div align="left">
		<ul>
			<%
			 
		    ArrayList<String> msgs=(ArrayList<String>)application.getAttribute("msgs");
			
			if(msgs != null){
				for(String msg:msgs){
					out.println("<li>"+msg+"</li>");
				}
			}
			%>
		</ul>
		</div>
	</div>
</body>
</html>








