<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<h2>request result</h2>
		<hr />
		<table width="400" border="1" cellpadding="5" cellspacing="1">
			<tr>
				<td width="50">이름</td>
				<td width="100"><%= request.getParameter("username")%></td>
			</tr>
			<tr>
				<td width="50">직업</td>
				<td width="100"><%= request.getParameter("job")%></td>
			</tr>
			<tr>
				<td width="50">직업</td>
				<td width="100">
					<% //getParameterValues : 배열
					String favorites[]=request.getParameterValues("favorite");
					
					for(String favorite : favorites){
						out.println(favorite + "<br>");
					}
					%>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>