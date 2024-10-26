<%@page import="Book.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "./header.jsp"%>
<section style = "position: fixed; width: 100%; top: 150px">
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
				alert("출판사가 입력되지 않았습니다.");
				f1.publisher.focus();
				return;
			}
			if(f1.price.value == ""){
				alert("가격이 입력되지 않았습니다.");
				f1.price.focus();
				return;
			}
			alert("도서등록이 완료되었습니다.");
			f1.submit();
			}
			
		</script>
		<h1 style= "text-align: center">도서 등록 화면</h1>
		<form name= "f1" action="./registerPro.jsp" style = "display: flex; justify-content: center; align-items: center">
		<table border="1">
			<tr><th>
			도서코드
			</th>	
			<td>
			<input type = "text" readonly="readonly" value = "<%=code%>" name = "bookCode">
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
			<select name = publisher>
				<option value ="">츨판사선택</option>
				<option value = "1001">영출판사</option>
				<option value = "1002">북스미디어</option>
				<option value = "1003">한아카데미</option>
				<option value = "1004">이지스</option>
			</select>
			</td> </tr>
			
			<tr><th>
			가격
			</th>
			<td>
			<input type = "text" name = "price">
			</td> </tr>
			
			<tr><th>
			등록날짜
			</th>
			<td>
			<input type = "text" name = "date" placeholder="<%=date%>">
			</td> </tr>
			
			<tr>
			<td colspan="2" style = "text-align: center"> <input type = "button" onclick="checkform()" value ="등록"> <input type = "reset" value = "취소"> </td>
			</tr>
		</table>
		</form>
		
</section>
<%@include file= "./footer.jsp"%>