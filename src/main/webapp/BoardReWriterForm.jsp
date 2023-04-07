<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
	#container {
		width: 70%;
		margin: 0 auto; /*가로로 중앙에 배치*/
		padding-top: 10%;
		
	}
	#list {
	text-align: center;
	
	}
	#write {
	text-align: right;
	}
	/*부트스트랩 수정*/
    .table > thead {
      background-color: #b3c6ff;
    }
    .table > thead > tr > th {
      text-align: center;
    }
    .table-hover > tbody > tr:hover {
      background-color: #e6ecff;
    }
    .table > tbody > tr > td {
      text-align: center;
    }
    .table > tbody > tr > #title {
      text-align: left;
    }
    div > #paging {
      text-align: center;
    }
    .hit {
      animation-name: blink;/*애니메이션의 이름*/
      animation-duration: 1.5s;/*애니메이션의 동작 시간('1s','0.5s'와 같은 형식으로 지정)*/
      animation-timing-function: ease; /*애니메이션의 타이밍 : 시작과 종료를 부드럽게*/
      animation-iteration-count: infinite; /* 애니메이션의 동작 회수('infinite'를 지정하면 무한 반복)*/
      /* 위 속성들을 한 줄로 표기하기 */
      /* -webkit-animation: blink 1.5s ease infinite; */
    }
    /* 애니메이션 지점 설정하기 */
    /* 익스플로러 10 이상, 최신 모던 브라우저에서 지원 */
    @keyframes blink {
      from {color: white;}
      30% {color: yellow;}
      to {color: red; font-weight: bold;}
      /* 0% {color:white;}
      30% {color: yellow;}
      100% {color:red; font-weight: bold;} */
    }
</style>
<title>답글 쓰기</title>
</head>
<body>
	<center>
		<h2>답글 쓰기</h2>
		<form action="BoardReWriterProcCon.do" method="post">
			<table width="600" border="1" bordercolor="gray" bgcolor="ivory">
				<tr height="40">
					<td width="200" align="center">작성자</td>
					<td width="400"><input type="text" name="writer" size="30" style="border: none; background: transparent"></td>
				</tr>
				<tr height="40">
					<td width="200" align="center">제목</td>
					<td width="400"><input type="text" name="subject" size="60" value="[답변]" style="border: none; background: transparent"></td>
				</tr>
				<tr height="40">
					<td width="200" align="center">이메일</td>
					<td width="400"><input type="email" name="email" size="60" style="border: none; background: transparent"></td>
				</tr>
				<tr height="40">
					<td width="200" align="center">패스워드</td>
					<td width="400"><input type="password" name="password" size="60" style="border: none; background: transparent"></td>
				</tr>
				<tr height="40">
					<td width="200" align="center">글내용</td>
					<td width="400"><textarea style="resize: none" rows="10" cols="50" name="contents" style="border: none; background: transparent"></textarea></td>
				</tr>
				<tr height="40">
					<td colspan="2" align="center">
						<input type="hidden" value="${ref}" name="ref">
						<input type="hidden" value="${re_step}" name="re_step">
						<input type="hidden" value="${re_level}" name="re_level">
						<input type="submit" value="답글작성" >&nbsp;&nbsp;
						<input type="reset" value="다시작성" >&nbsp;&nbsp;
						<input type="button" value="전체글보기" onclick="location.href='BoardListCon.do'">
					</td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>