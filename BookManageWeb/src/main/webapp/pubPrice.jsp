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
ArrayList<PriceVO> priceList = dao.pubPrice();
if(bookList.isEmpty()){
	%>
	<h2 style = "text-align: center">도서 등록 정보가 존재하지 않습니다.</h2>
	<button onclick="location.href= './index.jsp'" style = "text-align: center">돌아가기</button>
	<%
}else{
%>
<form action="" style = "display: flex; justify-content: center; align-items: center">
	<table border="1">
	<tr>
		<th>출판사</th>
		<th>매출</th>
		<th>수량</th>

	</tr>
	<%	
	DecimalFormat df = new DecimalFormat("#,###");
	for(int i = 0; i < priceList.size(); i++){
		String pub = dao.changePub(priceList.get(i).getBpub());%>
	<tr>
		<td><%=pub%></td>
		<td><%=df.format(priceList.get(i).getPrice())%></td>
		<td><%=priceList.get(i).getCount()%></td>
		
	</tr><%} %>
	</table>
	
</form>	
<%} %>
</section>

<%@include file= "./footer.jsp"%>