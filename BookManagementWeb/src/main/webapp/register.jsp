<%@page import="Book.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./header.jsp"%>
<section class="main-section">
		<%
		BookDAO dao = new BookDAO();
		int code = dao.getCode();
        String date = dao.getDate();
		%>
		<script type="text/javascript">
		function checkform() {
			if(f1.bookName.value == ""){
				alert("도서제목이 입력되지 않았습니다.");
				f1.bookName.focus();
				return;
			}
			if(f1.bookWriter.value == ""){
				alert("도서저자가 입력되지 않았습니다.");
				f1.bookWriter.focus();
				return;
			}

            if(f1.publisher.value == ""){
         	alert("출판사명을 입력해주세요.");
          	f1.publisher.focus();
          	return;
         	 }
			if(f1.price.value == ""){
				alert("가격이 입력되지 않았습니다.");
				f1.price.focus();
				return;
			}
			if(f1.date.value == ""){
				alert("날짜가 입력되지 않았습니다.");
				f1.date.focus();
				return;
			}
			f1.submit(); 
			}

		</script>
		<div class="content-container">
		    <h1>도서 등록 화면</h1>
		    <form name= "f1" action="./registerPro.jsp" class="form-display">
		    <table>
			    <tr><th>
			    도서코드
			    </th>
			    <td>
			    <input type = "text" readonly="readonly" value = "<%= code %>" name = "bookCode">
			    </td> </tr>

			    <tr><th>
			    도서제목
			    </th>
			    <td>
			    <input type = "text" name = "bookName">
			    </td> </tr>

			    <tr><th>
			    도서저자
			    </th>
			    <td>
			    <input type = "text" name = "bookWriter">
			    </td> </tr>

			    <tr><th>
			    출판사명
			    </th>
			    <td>
			    <input type = "text" name = "publisher" placeholder="출판사명 입력"> 
			    </td> </tr>

			    <tr><th>
			    가격
			    </th>
			    <td>
			    <input type = "text" name = "price" placeholder="ex)10000">
			    </td> </tr>

			    <tr><th>
			    등록날짜
			    </th>
			    <td>
			    <input type = "text" name = "date" placeholder="<%=date%>">

			    <tr>
			    <td colspan="2"> <input type = "button" onclick="checkform()" value ="등록"> <input type = "reset" value = "취소"> </td>
			    </tr>
		    </table>
		    </form>
		</div>
</section>
<%@include file= "./footer.jsp"%>