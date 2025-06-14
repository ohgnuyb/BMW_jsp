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
ArrayList<PriceVO> priceList = dao.pubPrice(); 
if(bookList.isEmpty()){
	%>
	<div class="content-container"> 
	    <h2 style = "text-align: center">도서 등록 정보가 존재하지 않아 매출 정보를 표시할 수 없습니다.</h2> 
	    <button onclick="location.href= './index.jsp'">돌아가기</button>
	<%
}else{
%>
<div class="content-container"> 
    <h2>출판사별 매출 조회</h2>
<form action="" class="form-display"> 
	<table> 
	<tr>
		<th>출판사</th>
		<th>매출</th>
		<th>수량</th>

	</tr>
	<%
	DecimalFormat df = new DecimalFormat("#,###");
	for(int i = 0; i < priceList.size(); i++){
		String pub = priceList.get(i).getBpub(); 
	%>
	<tr>
		<td><%=pub%></td>
		<td><%=df.format(priceList.get(i).getPrice())%></td>
		<td><%=priceList.get(i).getCount()%></td>

	</tr><%} %>
	</table>

</form>
</div>
<%} %>
</section>

<%@include file= "./footer.jsp"%>