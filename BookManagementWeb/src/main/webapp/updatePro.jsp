<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="Book.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.ParseException"%>
<%@include file= "./header.jsp"%>
<section class="main-section" style="display: none;"> <%-- 주요 콘텐츠 영역. 사용자에게는 보이지 않는 처리 페이지. --%>

<%
String errorMessage = null; // 오류 메시지를 저장할 변수.


try { // 모든 파라미터 가져오기 및 유효성 검사를 포함하는 메인 try-catch 블록 시작.
    BookDAO dao = new BookDAO(); // BookDAO 인스턴스 생성.


    int bookCode = Integer.valueOf(request.getParameter("bookCode")); // 도서 코드 파라미터를 정수로 가져옴.
    String bookName = request.getParameter("bookName");     // 도서 제목 파라미터를 가져옴.
    String bookWriter = request.getParameter("bookWriter"); // 도서 저자 파라미터를 가져옴.
    String date = request.getParameter("date");             // 날짜 파라미터를 가져옴.

    String publisher = request.getParameter("publisher");   // 출판사 파라미터를 가져옴.
    int price = 0; // 가격 변수 초기화.


    // 1. 출판사명 유효성 검사. 비어있는지 확인.
    if (publisher == null || publisher.trim().isEmpty()) {
        errorMessage = "출판사명을 입력해주세요."; // 비어있을 경우 오류 메시지 설정.
    }

    // 2. 가격 유효성 검사.
    if (errorMessage == null) { // 이전 단계에서 오류가 없으면 진행.
        try {
            price = Integer.valueOf(request.getParameter("price")); // 가격을 정수로 변환.
        } catch (NumberFormatException e) {
            errorMessage = "가격은 숫자만 입력해주세요."; // 숫자가 아닐 경우 오류 메시지.
        }
    }

    // 3. 날짜 형식 유효성 검사.
    if (errorMessage == null) { // 이전 단계에서 오류가 없으면 진행.
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // 날짜 형식 지정.
        sdf.setLenient(false); // 엄격하게 날짜 형식 검사.
        try {
            sdf.parse(date); // 날짜 문자열을 파싱 시도.
        } catch (ParseException e) {
            errorMessage = "날짜 형식이 올바르지 않습니다. (예: 2024-mm-dd)"; // 형식 불일치 시 오류 메시지.
        }
    }


    // 모든 유효성 검사가 완료된 후, 오류 여부에 따라 처리 분기.
    if (errorMessage == null) { // 오류가 없는 경우.
        // 모든 유효성 검사를 통과한 경우: 도서 수정 및 성공 알림.
        dao.updateBook(bookCode, bookName, bookWriter, publisher, price, date); // 도서 정보를 수정하는 기능.
        %>
        <script type="text/javascript">
            alert("도서수정이 완료되었습니다."); // 성공 알림 메시지.
            location.href = "./index.jsp"; // 홈 페이지로 이동.
        </script>
        <%
    } else { // 오류가 있는 경우.
        // 유효성 검사 중 오류가 발생한 경우: 오류 알림 및 이전 페이지로 이동.
        %>
        <script type="text/javascript">
            alert("<%= errorMessage %>"); // 오류 메시지 표시.
            history.back(); // 이전 페이지로 돌아감.
        </script>
        <%
    }

} catch (Exception e) { // 예상치 못한 다른 일반적인 오류가 발생한 경우.
    // 도서 수정 중 알 수 없는 오류가 발생했음을 알림.
    %>
    <script type="text/javascript">
        alert("도서 수정 중 알 수 없는 오류가 발생했습니다.");
        history.back(); // 이전 페이지로 돌아감.
    </script>
    <%
}
// 메인 try-catch 블록 끝.
%>

</section>
<%@include file= "./footer.jsp"%>