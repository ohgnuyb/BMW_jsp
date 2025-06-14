<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="Book.*"%>
<%@include file= "./header.jsp"%>
<section class="main-section" style="display: none;"> 

<%
BookDAO dao = new BookDAO();


int bookCode = Integer.valueOf(request.getParameter("bookCode"));

dao.deleteBook(bookCode);


%>
<script type="text/javascript">
    alert("도서가 성공적으로 삭제되었습니다.");
    location.href = "./index.jsp";
</script>
<%

%>

</section>
<%@include file= "./footer.jsp"%>