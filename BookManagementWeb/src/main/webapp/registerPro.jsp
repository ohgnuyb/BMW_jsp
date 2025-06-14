<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Book.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.ParseException"%>
<%@include file= "./header.jsp"%>
<section class="main-section" style="display: none;">

<%
String errorMessage = null; 


try {
    BookDAO dao = new BookDAO(); 


    String sBookCode = request.getParameter("bookCode");
    String bookName = request.getParameter("bookName");
    String bookWriter = request.getParameter("bookWriter");
    String date = request.getParameter("date");
    String publisher = request.getParameter("publisher");
    String sPrice = request.getParameter("price");

 
    if (publisher == null || publisher.trim().isEmpty()) {
        errorMessage = "출판사명을 입력해주세요.";
    }


    int bookCode = 0;
    if (errorMessage == null) { 
        try {
            bookCode = Integer.valueOf(sBookCode);
        } catch (NumberFormatException e) {
            errorMessage = "도서 코드가 올바르지 않습니다.";
        }
    }


    int price = 0; // 변수 초기화
    if (errorMessage == null) { 
        try {
            price = Integer.valueOf(sPrice);
        } catch (NumberFormatException e) {
            errorMessage = "가격은 숫자만 입력해주세요.";
        }
    }

    // 5. 날짜 형식 유효성 검사
    if (errorMessage == null) { 
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        sdf.setLenient(false); 
        try {
            sdf.parse(date);
        } catch (ParseException e) {
            errorMessage = "날짜 형식이 올바르지 않습니다. ex) yyyy-mm-dd";
        }
    }


    if (errorMessage == null) {
      
        dao.addBook(bookCode, bookName, bookWriter, publisher, price, date);
        %>
        <script type="text/javascript">
            alert("도서등록이 완료되었습니다.");
            location.href = "./index.jsp"; // JavaScript로 페이지 이동
        </script>
        <%
    } else {
       
        %>
        <script type="text/javascript">
            alert("<%= errorMessage %>");
            history.back(); // 이전 페이지로 돌아가기
        </script>
        <%
    }

} catch (Exception e) {
  
    %>
    <script type="text/javascript">
        alert("도서 등록 중 알 수 없는 오류가 발생했습니다.");
        history.back();
    </script>
    <%
}

%>

</section>
<%@include file= "./footer.jsp"%>