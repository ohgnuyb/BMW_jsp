<%@page import="Book.*"%>      
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./header.jsp"%>
<section class="main-section"> <%-- 페이지의 주요 콘텐츠 영역. --%>
		<%
		BookDAO dao = new BookDAO(); // BookDAO 객체를 생성.
		int code = dao.getCode();    // 새로운 도서 코드를 가져옴.
        String date = dao.getDate(); // 기본 날짜 형식 문자열을 가져옴.
		%>
		<script type="text/javascript">
		// 폼 제출 전 유효성을 검사하는 기능.
		function checkform() {
			if(f1.bookName.value == ""){ // 도서 제목이 비어있는지 확인.
				alert("도서제목이 입력되지 않았습니다.");
				f1.bookName.focus(); // 해당 입력 필드에 포커스.
				return; // 함수 종료.
			}
			if(f1.bookWriter.value == ""){ // 도서 저자가 비어있는지 확인.
				alert("도서저자가 입력되지 않았습니다.");
				f1.bookWriter.focus(); // 해당 입력 필드에 포커스.
				return; // 함수 종료.
			}

            if(f1.publisher.value == ""){ // 출판사명이 비어있는지 확인.
         	alert("출판사명을 입력해주세요.");
          	f1.publisher.focus(); // 해당 입력 필드에 포커스.
          	return; // 함수 종료.
         	 }
			if(f1.price.value == ""){ // 가격이 비어있는지 확인.
				alert("가격이 입력되지 않았습니다.");
				f1.price.focus(); // 해당 입력 필드에 포커스.
				return; // 함수 종료.
			}
			if(f1.date.value == ""){ // 날짜가 비어있는지 확인.
				alert("날짜가 입력되지 않았습니다.");
				f1.date.focus(); // 해당 입력 필드에 포커스.
				return; // 함수 종료.
			}
			f1.submit(); // 모든 유효성 검사를 통과하면 폼을 제출.
			}

		</script>
		<div class="content-container"> <%-- 콘텐츠를 담는 컨테이너. --%>
		    <h1>도서 등록 화면</h1> <%-- 화면 제목. --%>
		    <form name= "f1" action="./registerPro.jsp" class="form-display"> <%-- 도서 등록 폼. registerPro.jsp로 데이터를 전송. --%>
		    <table> <%-- 입력 필드를 포함하는 테이블. --%>
			    <tr><th>
			    도서코드
			    </th>
			    <td>
			    <input type = "text" readonly="readonly" value = "<%= code %>" name = "bookCode"> <%-- 도서 코드 입력 필드 (읽기 전용). --%>
			    </td> </tr>

			    <tr><th>
			    도서제목
			    </th>
			    <td>
			    <input type = "text" name = "bookName"> <%-- 도서 제목 입력 필드. --%>
			    </td> </tr>

			    <tr><th>
			    도서저자
			    </th>
			    <td>
			    <input type = "text" name = "bookWriter"> <%-- 도서 저자 입력 필드. --%>
			    </td> </tr>

			    <tr><th>
			    출판사명
			    </th>
			    <td>
			    <input type = "text" name = "publisher" placeholder="출판사명 입력"> <%-- 출판사명 입력 필드. --%>
			    </td> </tr>

			    <tr><th>
			    가격
			    </th>
			    <td>
			    <input type = "text" name = "price" placeholder="ex)10000"> <%-- 가격 입력 필드. --%>
			    </td> </tr>

			    <tr><th>
			    등록날짜
			    </th>
			    <td>
			    <input type = "text" name = "date" placeholder="<%=date%>"> <%-- 등록 날짜 입력 필드. --%>
			    </td> </tr>

			    <tr>
			    <td colspan="2"> <input type = "button" onclick="checkform()" value ="등록"> <input type = "reset" value = "취소"> </td> <%-- 등록 및 취소 버튼. --%>
			    </tr>
		    </table>
		    </form>
		</div>
</section>
<%@include file= "./footer.jsp"%> 