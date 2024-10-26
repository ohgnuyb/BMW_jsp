<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="Book.*"%>
<%@include file= "./header.jsp"%>
<section style = "position: fixed; width: 100%; top: 100px">

<%
BookDAO dao = new BookDAO();
BookVO vo = new BookVO();

int bookCode = Integer.valueOf(request.getParameter("bookCode"));
String bookName = request.getParameter("bookName");
String bookWriter = request.getParameter("bookWriter");
int publisher = Integer.valueOf(request.getParameter("publisher"));
int price = Integer.valueOf(request.getParameter("price"));
String date = request.getParameter("date");

dao.updateBook(bookCode, bookName, bookWriter, publisher, price, date);

response.sendRedirect("./index.jsp");
%>

</section>
<%@include file= "./footer.jsp"%>