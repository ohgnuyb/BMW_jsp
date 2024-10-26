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
int Bpub = Integer.valueOf(request.getParameter("publisherSearch"));
ArrayList<BookVO> searchList = dao.searchPro(Bpub);
if(searchList.isEmpty()){
	%>
	<h2 style = "text-align: center">도서 등록 정보가 존재하지 않습니다.</h2>
	<button onclick="location.href= './index.jsp'" style = "text-align: center">돌아가기</button>
	<%
}else{
%>
<form action="" style = "display: flex; justify-content: center; align-items: center">
	<table border="1">
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
	for(int i = 0; i < searchList.size(); i++){
	String[] date = searchList.get(i).getDate().split("-");
		String pub = dao.changePub(searchList.get(i).getPublisher());%>
	<tr>
		<td> <a href = "./update.jsp?bookCode=<%=searchList.get(i).getBookCode() %>"> <%=searchList.get(i).getBookCode() %> </a></td>
		<td><%=searchList.get(i).getBookName() %></td>
		<td><%=searchList.get(i).getBookWriter() %></td>
		<td><%=pub %></td>
		<td><%=df.format(searchList.get(i).getPrice()) %></td>
		<td><%=date[1]%>월<%=date[2]%>일</td>
		<td> <a href= "deletePro.jsp?bookCode=<%=searchList.get(i).getBookCode()%>" onclick="return confirm('정말 삭제겠습니까?')">삭제</a> </td>
	</tr><%} %>
	</table>
	
</form>	
<%} %>
</section>

<%@include file= "./footer.jsp"%>