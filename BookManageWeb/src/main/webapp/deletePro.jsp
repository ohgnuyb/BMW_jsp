<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="Book.*"%>
<%@include file= "./header.jsp"%>
<section style = "position: fixed; width: 100%; top: 100px">

<%
BookDAO dao = new BookDAO();
BookVO vo = new BookVO();

int bookCode = Integer.valueOf(request.getParameter("bookCode"));

dao.deleteBook(bookCode);

response.sendRedirect("./index.jsp");
%>
<script type="text/javascript">

</script>

</section>
<%@include file= "./footer.jsp"%>