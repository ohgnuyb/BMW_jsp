<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Book.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.ParseException"%>
<%@include file= "./header.jsp"%>
<section class="main-section" style="display: none;">

<%
BookDAO dao = new BookDAO();

int bookCode = Integer.valueOf(request.getParameter("bookCode"));
String bookName = request.getParameter("bookName");
String bookWriter = request.getParameter("bookWriter");
String date = request.getParameter("date");

String publisher = request.getParameter("publisher");
int price = 0;


if (publisher == null || publisher.trim().isEmpty()) {
    %>
    <script type="text/javascript">
        alert("출판사명을 입력해주세요.");
        history.back();
    </script>
    <%
    return; 
}

try {
    price = Integer.valueOf(request.getParameter("price"));

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    sdf.setLenient(false); 
    try {
        sdf.parse(date); 
    } catch (ParseException e) {
        %>
        <script type="text/javascript">
            alert("날짜 형식이 올바르지 않습니다. (예: 2024-mm-dd)");
            history.back();
        </script>
        <%
        return; 
    }


    dao.updateBook(bookCode, bookName, bookWriter, publisher, price, date);
    %>
    <script type="text/javascript">
        alert("도서수정이 완료되었습니다."); 
        location.href = "./index.jsp";
    </script>
    <%
} catch (NumberFormatException e) {

    %>
    <script type="text/javascript">
        alert("가격은 숫자만 입력해주세요.");
        history.back();
    </script>
    <%
}
%>

</section>
<%@include file= "./footer.jsp"%>