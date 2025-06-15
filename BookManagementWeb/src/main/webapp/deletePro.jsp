<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="Book.*"%>       <%-- Book 패키지 안의 클래스들을 사용하기 위해 필요. --%>
<%@include file= "./header.jsp"%> <%-- 공통 헤더 파일을 포함. --%>
<section class="main-section" style="display: none;"> <%-- 주요 콘텐츠 영역. 사용자에게는 보이지 않음. --%>

<%
BookDAO dao = new BookDAO(); // BookDAO 객체를 생성. 데이터 접근 기능을 사용하려고.

int bookCode = Integer.valueOf(request.getParameter("bookCode")); // 요청 파라미터에서 삭제할 도서 코드를 가져옴.

dao.deleteBook(bookCode); // 해당 bookCode를 가진 도서를 삭제하는 기능.

%>
<script type="text/javascript">
    alert("도서가 성공적으로 삭제되었습니다."); // 삭제 성공 알림 메시지.
    location.href = "./index.jsp"; // 홈 페이지로 이동.
</script>
<%

%>

</section>
<%@include file= "./footer.jsp"%> <%-- 공통 푸터 파일을 포함. --%>