<%@page import="java.text.*"%>       
<%@page import="java.lang.*"%>       
<%@page import="java.util.ArrayList"%>  
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="Book.*"%>        
<%@include file= "./header.jsp"%>   <
<section class="main-section"> <%-- 페이지의 주요 콘텐츠 영역. --%>
<%
BookDAO dao = new BookDAO(); // BookDAO 객체를 생성. 데이터 접근 기능을 사용하려고.
String publisherSearchName = request.getParameter("publisherSearch"); // 요청 파라미터에서 검색할 출판사 이름을 가져옴.
ArrayList<BookVO> searchList = dao.searchPro(publisherSearchName); // 출판사 이름으로 도서를 검색하고 결과를 가져옴.
if(searchList.isEmpty()){ // 검색 결과 리스트가 비어있는지 확인.
	%>
	<div class="content-container"> <%-- 콘텐츠를 담는 컨테이너. --%>
	    <h2 style = "text-align: center">검색 결과가 존재하지 않습니다.</h2> <%-- 검색 결과가 없을 때 메시지 표시. --%>
	    <button onclick="location.href= './index.jsp'">돌아가기</button> <%-- 홈으로 돌아가는 버튼. --%>
	</div>
	<%
}else{ // 검색 결과가 있다면
%>
<div class="content-container"> <%-- 콘텐츠를 담는 컨테이너. --%>
    <h2>검색 결과</h2> <%-- 검색 결과 화면 제목. --%>
<form action="" class="form-display"> <%-- 폼 영역. 실제 제출되는 기능은 없음. --%>
	<table> <%-- 검색된 도서 정보를 표시할 테이블. --%>
	<tr>
		<th>도서코드</th> <%-- 테이블 헤더: 도서코드. --%>
		<th>도서제목</th> <%-- 테이블 헤더: 도서제목. --%>
		<th>도서저자</th> <%-- 테이블 헤더: 도서저자. --%>
		<th>출판사</th> <%-- 테이블 헤더: 출판사. --%>
		<th>가격</th> <%-- 테이블 헤더: 가격. --%>
		<th>등록날짜</th> <%-- 테이블 헤더: 등록날짜. --%>
		<th>삭제</th> <%-- 테이블 헤더: 삭제 기능. --%>
	</tr>
	<%
	DecimalFormat df = new DecimalFormat("#,###"); // 숫자를 쉼표 형식으로 포맷할 때 사용.
	for(int i = 0; i < searchList.size(); i++){ // 검색된 도서 리스트를 하나씩 순회.
	String[] date = searchList.get(i).getDate().split("-"); // 등록 날짜를 '-' 기준으로 분리.
		String pub = searchList.get(i).getPublisher(); // 도서 객체에서 출판사 이름을 가져옴.
	%>
	<tr>
		<td> <a href = "./update.jsp?bookCode=<%=searchList.get(i).getBookCode() %>"> <%=searchList.get(i).getBookCode() %> </a></td> <%-- 도서코드와 수정 페이지 링크. --%>
		<td><%=searchList.get(i).getBookName() %></td> <%-- 도서 제목 표시. --%>
		<td><%=searchList.get(i).getBookWriter() %></td> <%-- 도서 저자 표시. --%>
		<td><%=pub %></td> <%-- 출판사 이름 표시. --%>
		<td><%=df.format(searchList.get(i).getPrice()) %></td> <%-- 가격을 쉼표 형식으로 포맷하여 표시. --%>
		<td><%=date[1]%>월<%=date[2]%>일</td> <%-- 날짜에서 월과 일만 추출하여 표시. --%>
		<td> <a href= "deletePro.jsp?bookCode=<%=searchList.get(i).getBookCode()%>" onclick="return confirm('정말 삭제겠습니까?')">삭제</a> </td> <%-- 삭제 링크와 확인 메시지. --%>
	</tr><%} %>
	</table>

</form>
</div>
<%} %>
</section>

<%@include file= "./footer.jsp"%>