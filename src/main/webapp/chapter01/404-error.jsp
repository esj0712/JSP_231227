<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- action tag : 액션태그 -->
<!-- Date now=new.Data() -->
<%-- <jsp:useBean id="now" class="java.util.Date"/> --%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>404 ERROR</title>
</head>
<body>
<div align="center">
	<h2>404 ERROR</h2>
	<hr />
	<table>
		<tr width=100% bgcolor="pink">
			<td>요청하신 페이지를 찾을수가 없습니다.<br>
				URL 주소를 다시한번 확인해주세요!!
			</td>
		</tr>
			<tr>
				<td>${now}
					<p>
						요청실패 URL : ${pageContext.errorData.requestURI}<br>
						상태 코드 : ${pageContext.errorData.statusCode }<br>
						예외 유형 : ${pageContext.errorData.throwable }
				</td>
			</tr>
	</table>
</div>
</body>
</html>