<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>도서 등록 프로그램</title> 
<link rel="stylesheet" href="./style/style.css"> 
</head>
<body>
<style>
    body {
        display: flex; /* Flexbox 레이아웃을 사용. */
        flex-direction: column; /* 아이템들을 세로 방향으로 정렬. */
        min-height: 100vh; /* 뷰포트 높이의 최소 100%를 차지하게 함. 푸터를 항상 하단에 두는 데 도움. */
    }
</style>
<header class="main-header"> <%-- 웹 페이지의 헤더(상단) 영역. --%>
	<h2>도서 등록 프로그램</h2> <%-- 헤더의 메인 제목. --%>
	<nav> <%-- 내비게이션 링크들을 담는 영역. --%>
		<div class="main-nav"> <%-- 내비게이션 링크들을 그룹화하는 div. --%>
			<a href="./register.jsp">도서등록</a>      <%-- 도서 등록 페이지로 가는 링크. --%>
			<a href="BookList.jsp">도서목록조회</a>   <%-- 도서 목록 조회 페이지로 가는 링크. --%>
			<a href="search.jsp">도서검색</a>         <%-- 도서 검색 페이지로 가는 링크. --%>
			<a href="./pubPrice.jsp">출판사별매출조회</a> <%-- 출판사별 매출 조회 페이지로 가는 링크. --%>
			<a href="index.jsp">홈으로</a>            <%-- 홈 페이지로 가는 링크. --%>
		</div>
	</nav>
</header>