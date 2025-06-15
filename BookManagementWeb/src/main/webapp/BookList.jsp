<%@page import="java.text.*"%>     <%-- 숫자 형식화를 위해 필요. --%>
<%@page import="java.lang.*"%>     <%-- 기본 Java 클래스들을 위한 임포트. --%>
<%@page import="java.util.ArrayList"%> <%-- 리스트 사용을 위해 필요. --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="Book.*"%>       <%-- Book 패키지 안의 클래스들을 사용하기 위해 필요. --%>
<%@include file= "./header.jsp"%> <%-- 공통 헤더 파일을 포함. --%>

<section class="main-section"> <%-- 페이지의 주요 콘텐츠 영역. --%>
<%
BookDAO dao = new BookDAO(); // BookDAO 객체를 생성. 데이터 접근 기능을 사용하려고.
ArrayList<BookVO> bookList = dao.bookList; // 모든 도서 목록을 가져옴.
if(bookList.isEmpty()){ // 도서 목록이 비어있는지 확인.
	%>
	<div class="content-container"> <%-- 콘텐츠를 담는 컨테이너. --%>
	    <h2 style = "text-align: center">도서 등록 정보가 존재하지 않습니다.</h2> <%-- 도서가 없을 때 메시지 표시. --%>
	    <button onclick="location.href= './index.jsp'">돌아가기</button> <%-- 홈으로 돌아가는 버튼. --%>
	</div>
	<%
}else{ // 도서 목록이 비어있지 않다면
%>
<div class="content-container"> <%-- 콘텐츠를 담는 컨테이너. --%>
    <h2>도서 목록</h2> <%-- 도서 목록 화면 제목. --%>
<form action="" class="form-display"> <%-- 폼 영역. 실제 제출되는 기능은 없음. --%>
	<table> <%-- 도서 정보를 표시할 테이블. --%>
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
	for(int i = 0; i < bookList.size(); i++){ // 도서 목록을 하나씩 순회.
	String[] date = bookList.get(i).getDate().split("-"); // 등록 날짜를 '-' 기준으로 분리.
		String pub = bookList.get(i).getPublisher(); // 도서 객체에서 출판사 이름을 직접 가져옴.
	%>
	<tr>
		<td> <a href = "./update.jsp?bookCode=<%=bookList.get(i).getBookCode() %>"> <%=bookList.get(i).getBookCode() %> </a></td> <%-- 도서코드와 수정 페이지 링크. --%>
		<td><%=bookList.get(i).getBookName() %></td> <%-- 도서 제목 표시. --%>
		<td><%=bookList.get(i).getBookWriter() %></td> <%-- 도서 저자 표시. --%>
		<td><%=pub %></td> <%-- 출판사 이름 표시. --%>
		<td><%=df.format(bookList.get(i).getPrice()) %></td> <%-- 가격을 쉼표 형식으로 포맷하여 표시. --%>
		<td><%=date[1]%>월<%=date[2]%>일</td> <%-- 날짜에서 월과 일만 추출하여 표시. --%>
		<td> <a href= "deletePro.jsp?bookCode=<%=bookList.get(i).getBookCode()%>" onclick="return confirm('정말 삭제겠습니까?')">삭제</a> </td> <%-- 삭제 링크와 확인 메시지. --%>
	</tr><%} %>
	</table>

</form>
</div>
<%} %>
</section>

<%@include file= "./footer.jsp"%> <%-- 공통 푸터 파일을 포함. --%>