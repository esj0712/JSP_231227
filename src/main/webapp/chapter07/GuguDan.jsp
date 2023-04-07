<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSTL GuguDan</title>
</head>
<body>
	<center>
		<h2>구구단</h2>
		<hr />
		<table border="1" width="800">
			<c:forEach var="i" begin="1" end="9">
				<tr height="40">
					<c:forEach var="j" begin="2" end="9">
						<td align="center">
							${j } X ${i } = ${j*i } <br>
						</td>
					</c:forEach>
				</tr>
			</c:forEach>
		</table>
	</center>
</body>
</html>