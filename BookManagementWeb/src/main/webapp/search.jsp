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
	    <h2>도서 등록 정보가 존재하지 않습니다.</h2>
	    <button onclick="location.href= './index.jsp'">돌아가기</button> 
	</div>
	<%
}else{
%>
<div class="content-container"> 
    <h2>도서 검색 화면</h2>
    <form action="./searchPro.jsp" class="form-display"> 

    	<table>
    		<tr> <th>검색할 출판사명</th> 
    				<td>
    					<input type="text" name="publisherSearch" placeholder="출판사명 입력"> 
    		</tr>
    		<tr>
    		<td colspan="2"> <input type = "submit" value = "검색"> <input type = "reset" value ="취소"> </td>
    		</tr>
    	</table>

    </form>
</div> 
<%} %>
</section>

<%@include file= "./footer.jsp"%>