<%@page import="java.util.ArrayList"%>
<%@page import="Book.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./header.jsp"%>
<section class="main-section">
		<%
		BookDAO dao = new BookDAO();
        int bookCode = Integer.valueOf(request.getParameter("bookCode"));
        int i = dao.updatei(bookCode);
        ArrayList<BookVO> bookList = dao.bookList;
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
            	eturn;
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
		    <h1>도서 수정 화면</h1>
		    <form name= "f1" action="./updatePro.jsp" class="form-display">
		    <table>
			    <tr>
			    <th>
			    도서코드
			    </th>
			    <td>
			    <input type = "text" readonly="readonly" value = "<%= bookCode %>" name = "bookCode">
			    </td>
			    </tr>

			    <tr><th>
			    도서제목
			    </th>
			    <td>
			    <input type = "text" name = "bookName" value = "<%= bookList.get(i).getBookName() %>">
			    </td> </tr>

			    <tr><th>
			    도서저자
			    </th>
			    <td>
			    <input type = "text" name = "bookWriter" value = "<%= bookList.get(i).getBookWriter() %>">
			    </td> </tr>

			    <tr><th>
			    출판사명
			    </th>
			    <td>
			    <input type = "text" name = "publisher" value = "<%= bookList.get(i).getPublisher() %>" placeholder="출판사명 입력"> 
			    </td> </tr>

			    <tr><th>
			    가격
			    </th>
			    <td>
			    <input type = "text" name = "price" value = "<%= bookList.get(i).getPrice() %>" placeholder="ex)10000"> 
			    </td> </tr>

			    <tr><th>
			    등록날짜
			    </th>
			    <td>
			    <input type = "text" name = "date" value = "<%= bookList.get(i).getDate() %>">
			    </td> </tr>

			    <tr>
			    <td colspan="2"> <input type = "button" onclick="checkform()" value ="수정"> <input type = "reset" value = "취소"> </td>
			    </tr>
		    </table>
		    </form>
		</div>
</section>
<%@include file= "./footer.jsp"%>