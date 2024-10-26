<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.divTitle{
		text-align: center;
		margin-top: -25px
		 
	}
	.divTitle > a {
		color: black;
		text-decoration: none;
	}
	body {
  margin: 0;
}
</style>
</head>
<body>
<header style = "width: 100%; height: 100px; top: 0px; background-color: skyblue; line-height: 50px; position: fixed">
	<h2 style = "text-align: center; margin-top: 5px">도서 등록 프로그램</h2>
	<nav>
		<div class="divTitle">
			<a href="./register.jsp">도서등록</a> &nbsp;&nbsp;&nbsp;
			<a href="BookList.jsp">도서목록조회</a>&nbsp;&nbsp;&nbsp;	
			<a href="search.jsp">도서검색</a>&nbsp;&nbsp;&nbsp;
			<a href="./pubPrice.jsp">출판사별매출조회</a>&nbsp;&nbsp;&nbsp;
			<a href="index.jsp">홈으로</a>
		</div>
	</nav>

</header>
