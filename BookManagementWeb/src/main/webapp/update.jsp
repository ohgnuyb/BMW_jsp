<%@page import="java.util.ArrayList"%>   
<%@page import="Book.*"%>                
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./header.jsp"%>      
<section class="main-section">         
		<%
		BookDAO dao = new BookDAO();       // BookDAO 객체를 생성.
        int bookCode = Integer.valueOf(request.getParameter("bookCode")); // 요청 파라미터에서 도서 코드를 가져옴.
        int i = dao.updatei(bookCode);     // 해당 도서 코드의 리스트 인덱스를 찾음.
        ArrayList<BookVO> bookList = dao.bookList; // 모든 도서 목록을 가져옴.
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
            	f1.publisher.focus();
            	eturn; // 오타 'eturn' (return으로 수정 필요)
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
		    <h1>도서 수정 화면</h1> <%-- 화면 제목. --%>
		    <form name= "f1" action="./updatePro.jsp" class="form-display"> <%-- 도서 수정 폼. updatePro.jsp로 데이터를 전송. --%>
		    <table> <%-- 입력 필드를 포함하는 테이블. --%>
			    <tr>
			    <th>
			    도서코드
			    </th>
			    <td>
			    <input type = "text" readonly="readonly" value = "<%= bookCode %>" name = "bookCode"> <%-- 도서 코드 입력 필드 (읽기 전용). --%>
			    </td>
			    </tr>

			    <tr><th>
			    도서제목
			    </th>
			    <td>
			    <input type = "text" name = "bookName" value = "<%= bookList.get(i).getBookName() %>"> <%-- 도서 제목 입력 필드. --%>
			    </td> </tr>

			    <tr><th>
			    도서저자
			    </th>
			    <td>
			    <input type = "text" name = "bookWriter" value = "<%= bookList.get(i).getBookWriter() %>"> <%-- 도서 저자 입력 필드. --%>
			    </td> </tr>

			    <tr><th>
			    출판사명
			    </th>
			    <td>
			    <input type = "text" name = "publisher" value = "<%= bookList.get(i).getPublisher() %>" placeholder="출판사명 입력"> <%-- 출판사명 입력 필드. --%>
			    </td> </tr>

			    <tr><th>
			    가격
			    </th>
			    <td>
			    <input type = "text" name = "price" value = "<%= bookList.get(i).getPrice() %>" placeholder="ex)10000"> <%-- 가격 입력 필드. --%>
			    </td> </tr>

			    <tr><th>
			    등록날짜
			    </th>
			    <td>
			    <input type = "text" name = "date" value = "<%= bookList.get(i).getDate() %>"> <%-- 등록 날짜 입력 필드. --%>
			    </td> </tr>

			    <tr>
			    <td colspan="2"> <input type = "button" onclick="checkform()" value ="수정"> <input type = "reset" value = "취소"> </td> <%-- 수정 및 취소 버튼. --%>
			    </tr>
		    </table>
		    </form>
		</div>
</section>
<%@include file= "./footer.jsp"%> 