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
ArrayList<BookVO> bookList = dao.bookList; // 모든 도서 목록을 가져옴.
if(bookList.isEmpty()){ // 도서 목록이 비어있는지 확인.
	%>
	<div class="content-container"> <%-- 콘텐츠를 담는 컨테이너. --%>
	    <h2>도서 등록 정보가 존재하지 않습니다.</h2> <%-- 도서가 없을 때 메시지 표시. --%>
	    <button onclick="location.href= './index.jsp'">돌아가기</button> <%-- 홈으로 돌아가는 버튼. --%>
	</div>
	<%
}else{ // 도서 목록이 비어있지 않다면
%>
<div class="content-container"> <%-- 콘텐츠를 담는 컨테이너. --%>
    <h2>도서 검색 화면</h2> <%-- 화면 제목. --%>
    <form action="./searchPro.jsp" class="form-display"> <%-- 검색 폼. searchPro.jsp로 데이터를 전송. --%>

    	<table> <%-- 검색 입력 필드를 포함하는 테이블. --%>
    		<tr> <th>검색할 출판사명</th> <%-- 테이블 헤더: 검색할 출판사명. --%>
    				<td>
    					<input type="text" name="publisherSearch" placeholder="출판사명 입력"> <%-- 출판사명 검색 입력 필드. --%>
    		</tr>
    		<tr>
    		<td colspan="2"> <input type = "submit" value = "검색"> <input type = "reset" value ="취소"> </td> <%-- 검색 및 취소 버튼. --%>
    		</tr>
    	</table>

    </form>
</div>
<%} %>
</section>

<%@include file= "./footer.jsp"%>