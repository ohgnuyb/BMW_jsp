<%@page import="java.text.*"%>    
<%@page import="java.lang.*"%>    
<%@page import="java.util.ArrayList"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="Book.*"%>      
<%@include file= "./header.jsp"%> 

<section class="main-section"> <%-- 페이지의 주요 콘텐츠 영역. --%>
<%
BookDAO dao = new BookDAO(); // BookDAO 객체를 생성. 데이터 접근 기능을 사용하려고.
ArrayList<BookVO> bookList = dao.bookList; // 모든 도서 목록을 가져옴. (도서 유무 확인용)
ArrayList<PriceVO> priceList = dao.pubPrice(); // 출판사별 매출 정보를 가져옴.
if(bookList.isEmpty()){ // 도서 목록이 비어있는지 확인.
	%>
	<div class="content-container"> <%-- 콘텐츠를 담는 컨테이너. --%>
	    <h2 style = "text-align: center">도서 등록 정보가 존재하지 않아 매출 정보를 표시할 수 없습니다.</h2> <%-- 도서가 없을 때 메시지 표시. --%>
	    <button onclick="location.href= './index.jsp'">돌아가기</button> <%-- 홈으로 돌아가는 버튼. --%>
	</div>
	<%
}else{ // 도서 목록이 비어있지 않다면
%>
<div class="content-container"> <%-- 콘텐츠를 담는 컨테이너. --%>
    <h2>출판사별 매출 조회</h2> <%-- 화면 제목. --%>
<form action="" class="form-display"> <%-- 폼 영역. 실제 제출되는 기능은 없음. --%>
	<table> <%-- 출판사별 매출 정보를 표시할 테이블. --%>
	<tr>
		<th>출판사</th> <%-- 테이블 헤더: 출판사. --%>
		<th>매출</th> <%-- 테이블 헤더: 매출. --%>
		<th>수량</th> <%-- 테이블 헤더: 수량. --%>

	</tr>
	<%
	DecimalFormat df = new DecimalFormat("#,###"); // 숫자를 쉼표 형식으로 포맷할 때 사용.
	for(int i = 0; i < priceList.size(); i++){ // 매출 정보 리스트를 하나씩 순회.
		String pub = priceList.get(i).getBpub(); // PriceVO 객체에서 출판사 이름을 가져옴.
	%>
	<tr>
		<td><%=pub%></td> <%-- 출판사 이름 표시. --%>
		<td><%=df.format(priceList.get(i).getPrice())%></td> <%-- 매출액을 쉼표 형식으로 포맷하여 표시. --%>
		<td><%=priceList.get(i).getCount()%></td> <%-- 도서 수량 표시. --%>

	</tr><%} %>
	</table>

</form>
</div>
<%} %>
</section>

<%@include file= "./footer.jsp"%>