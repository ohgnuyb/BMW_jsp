<%@page import="java.text.*"%>
<%@page import="java.lang.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="Book.*"%>
<%@include file= "./header.jsp"%>

<section class="main-section">
<%
BookDAO dao = new BookDAO();
ArrayList<BookVO> bookList = dao.bookList;
if(bookList.isEmpty()){
	%>
	<div class="content-container"> 
	    <h2 style = "text-align: center">도서 등록 정보가 존재하지 않습니다.</h2>
	    <button onclick="location.href= './index.jsp'">돌아가기</button>
	</div>
	<%
}else{
%>
<div class="content-container">
    <h2>도서 목록</h2>
<form action="" class="form-display">
	<table>
	<tr>
		<th>도서코드</th>
		<th>도서제목</th>
		<th>도서저자</th>
		<th>출판사</th>
		<th>가격</th>
		<th>등록날짜</th>
		<th>삭제</th>
	</tr>
	<%
	DecimalFormat df = new DecimalFormat("#,###");
	for(int i = 0; i < bookList.size(); i++){
	String[] date = bookList.get(i).getDate().split("-");
		String pub = bookList.get(i).getPublisher(); 
	%>
	<tr>
		<td> <a href = "./update.jsp?bookCode=<%=bookList.get(i).getBookCode() %>"> <%=bookList.get(i).getBookCode() %> </a></td>
		<td><%=bookList.get(i).getBookName() %></td>
		<td><%=bookList.get(i).getBookWriter() %></td>
		<td><%=pub %></td>
		<td><%=df.format(bookList.get(i).getPrice()) %></td>
		<td><%=date[1]%>월<%=date[2]%>일</td>
		<td> <a href= "deletePro.jsp?bookCode=<%=bookList.get(i).getBookCode()%>" onclick="return confirm('정말 삭제겠습니까?')">삭제</a> </td>
	</tr><%} %>
	</table>

</form>
</div> 
<%} %>
</section>

<%@include file= "./footer.jsp"%>