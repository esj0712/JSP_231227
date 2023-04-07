<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="bb1" class="chapter09.Bank1Bean" scope="page"/>
<jsp:useBean id="bb2" class="chapter09.Bank2Bean" scope="page"/>

<% 
if(request.getMethod().equals("POST")){
	if(bb1.transfer(Integer.parseInt(request.getParameter("bal")))){
		out.println("<script>alert('정상처리 되었습니다.')</script>");
	}else
		out.println("<script>alert('수용 한도를 초과 하였습니다..')</script>");
}
// 이체 결과 확인
bb1.getData();
bb2.getData();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>transaction</title>
</head>
<body>
	<div align="center">
		<h3>계좌 현황</h3>
		<hr />
		<p></p>
		<table border="1" cellpadding="5" cellspacing="1">
			<tr>
				<td>Bank1</td>
				<td>이름 : <%=bb1.getAname() %></td>
				<td>잔액 : <%=bb1.getBalance() %></td>
			</tr>
			<tr>
				<td>Bank2</td>
				<td>이름 : <%=bb2.getAname() %></td>
				<td>잔액 : <%=bb2.getBalance() %></td>
			</tr>
		</table>
		<!-- 요청 -->
		<hr />
		<p></p>
		<form action="transanction.jsp" method="post">
			이체금액 : <input type="text" name="bal" width="200" size="5">
					<input type="submit" value="이체실행">
					<input type="reset"" value="다시입력">
		</form>
	</div>
</body>
</html>