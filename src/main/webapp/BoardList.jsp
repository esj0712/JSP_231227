<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<title>전체 게시글(BoardList)</title>
</head>
<body>
	<c:if test="${msg==0}">
		<script type="text/javascript">
			alert("수정시 비밀번호가 일치하지 않습니다.")		
		</script>
	</c:if>
	<c:if test="${msg==1}">
		<script type="text/javascript">
			alert("삭제시 비밀번호가 일치하지 않습니다.")	
		</script>
	</c:if>
	<div id="container">
		<!-- Login 검증 -->
		<div align="right">
			<c:if test="${id != null}">
				<%-- <%@ include file="loginOK.jsp" %> --%>
			</c:if>
			
			<c:if test="${id == null}">
				<%-- <%@ include file="login.jsp" %> --%>
			</c:if>
		</div>
		<div id="list">
			<b>게시글 (전체 글 : ${count})</b>
		</div>
		<div id="write">
			<a href="BoardWriteForm.jsp" style="text-decoration: none;">글쓰기</a>
		</div>
		<!-- <table> 태그에 .table-hover 클래스를 추가하면 테이블에 마우스를 올렸을 때의 반환값  
		<table> 태그에 .table-boardered 선택자를 추가하면 셀에 테두리 생성 
		<table> 태그에 .table-stripe 선택자를 추가하면 한 줄 건너 배경색이 달라지는 스트라이프 -->
		<div>
			<table class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th width="150">번호</th>
						<th width="500">제목</th>
						<th width="150">작성자</th>
						<th width="150">작성일</th>
						<th width="150">조회수</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="number" value="${number}"/>
						<c:forEach var="bean" items="${v}">
							<tr height="40">
								<td width="50" align="left">${bean.num}</td>
								<td width="320" align="left">
									<!-- 들여쓰기 -->
									<c:if test="${bean.re_step > 1}">
										<c:forEach var="j" begin="1" end="${(bean.re_step-1)*5}">
										&nbsp;
					   					</c:forEach>
									</c:if> 
									<a href="BoardInfoControl.do?num=${bean.num}" style='text-decoration: none'>${bean.subject}</a>
								</td>
								<td width="100" align="center">${bean.writer}</td>
								<td width="150" align="center">${bean.reg_date}</td>
								<td width="80" align="center">${bean.readcount}</td>
							</tr>
						</c:forEach>
				</tbody>
			</table>
			<p></p>
			<!-- 페이지 카운트링 구현 -->
			<center>
				<c:if test="${count>0 }">
					<!--    전체글이 10일경우 10/10=1이므로 1페이지 전체글이 34일경우 34/10=3+1==>4페이지 -->
					<c:set var="pageCount"
						value="${count/pageSize+(count%pageSize==0 ? 0 : 1) }" />
					<!-- 시작 페이지 숫자를 지정  -->
					<c:set var="startPage" value="${1 }" />

					<c:if test="${currentPage%10 != 0 }">
						<!-- 1~9페이지까지 또는 11 12 13... -->
						<!-- = > 숫자를 양식에 맞춰 문자열로 변환해준다.나누기 연산시 정수형값으로 리턴해주기위한 변수 선언 integerOnly="true" : 정수 부분만 파생-->
						<fmt:parseNumber var="result" value="${currentPage/10 }"
							integerOnly="true" />
						<c:set var="startPage" value="${result*10+1 }" />
					</c:if>
					<!--  10 20 30페이지 -->
					<c:if test="${currentPage%10 == 0 }">
						<c:set var="startPage" value="${(result-1)*10+1 }" />
					</c:if>

					<!-- 화면에 보여질 페이지 처리 숫자를 표현 -->
					<c:set var="pageBlock" value="${10 }" />
					<!-- 첫번째 페이지 경우 : 1+10-1=10 -->
					<c:set var="endPage" value="${startPage+pageBlock-1 }" />

					<c:if test="${endPage>pageCount }">
						<c:set var="endPage" value="${pageCount }" />
					</c:if>

					<!-- 이전 링크를 파악 -->
					<c:if test="${startPage>10 }">
						<a href="BoardListCon.do?pageNum=${startPage-10 }"
							style="text-decoration: none">[이전]</a>
					</c:if>

					<!-- 페이징 처리 -->
					<c:forEach var="i" begin="${startPage }" end="${endPage }">
						<a href="BoardListCon.do?pageNum=${i}"
							style="text-decoration: none">[${i}]</a>
					</c:forEach>

					<!-- 다음페이지 -->
					<c:if test="${endPage<pageCount }">
						<a href="BoardListCon.do?pageNum=${startPage+10 }"
							style="text-decoration: none"> [다음]</a>
					</c:if>
				</c:if>
			</center>
		</div>
	</div>
</body>
</html>