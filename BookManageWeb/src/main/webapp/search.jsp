<%@page import="java.text.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="Book.*"%>
<%@include file= "./header.jsp"%>
<style>
	th{
	width: 100px;
	}
</style>
<section style = "position: fixed; width: 100%; top: 150px; text-align: center">
<%
BookDAO dao = new BookDAO();
ArrayList<BookVO> bookList = dao.bookList;
if(bookList.isEmpty()){
	%>
	<h2 style = "text-align: center">도서 등록 정보가 존재하지 않습니다.</h2>
	<button onclick="location.href= './index.jsp'" style = "text-align: center">돌아가기</button>
	<%
}else{
%>
<h2 style = "text-align: center">도서 검색 화면</h2>
<form action="./searchPro.jsp" style = "display: flex; justify-content: center; align-items: center">
	
	<table border="1">
		<tr> <th>출판사명</th> 
				<td> 
					<input name = publisherSearch type = "radio" value = 1001>영출판사
					<input name = publisherSearch type = "radio" value = 1002>북스미디어
					<input name = publisherSearch type = "radio" value = 1003>한아카데미
					<input name = publisherSearch type = "radio" value = 1004>이지스
				</td>
		</tr>
		<tr> 
		<td colspan="2"> <input type = "submit" value = "검색"> <input type = "reset" value ="취소"> </td>
		</tr>
	</table>
	
</form>	
<%} %>
</section>

<%@include file= "./footer.jsp"%>