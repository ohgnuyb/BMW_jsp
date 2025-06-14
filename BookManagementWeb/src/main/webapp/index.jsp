<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Book.BookVO"%>      
<%@page import="Book.BookDAO"%>      
<%@page import="java.text.DecimalFormat"%> 
<%@include file= "./header.jsp"%>

<section class="main-section">
    <div class="content-container home-content">

        <h1 class="main-title">도서 관리 시스템</h1>
        <p class="main-description">
            쉽고 빠르게 도서 정보를 등록, 조회, 수정하고 관리해보세요.
        </p>

        <div class="quick-search-section">
            <h2>도서 검색</h2>
            <form action="./searchPro.jsp" class="search-form">
                <input type="text" name="publisherSearch" placeholder="검색할 출판사명 입력" class="search-input">
                <button type="submit" class="search-button">검색</button>
            </form>
        </div>

        <div class="recent-books-section">
            <h2>최근 추가된 도서</h2>
            <div class="book-list-preview">
                <%
                    BookDAO dao = new BookDAO();
                    ArrayList<BookVO> allBooks = dao.bookList;
                    int displayCount = 3; 

                    if (allBooks.isEmpty()) {
                %>
                        <p class="no-books-message">아직 등록된 도서가 없습니다. 지금 바로 도서를 등록해보세요!</p>
                <%
                    } else {
                        
                        DecimalFormat df = new DecimalFormat("#,###");
                        for (int i = allBooks.size() - 1; i >= 0 && displayCount > 0; i--) {
                            BookVO book = allBooks.get(i);
                %>
                            <div class="book-card">
                                <h3><%= book.getBookName() %></h3>
                                <p><strong>저자:</strong> <%= book.getBookWriter() %></p>
                                <p><strong>출판사:</strong> <%= book.getPublisher() %></p>
                                <p><strong>가격:</strong> <%= df.format(book.getPrice()) %>원</p>
                                <a href="./update.jsp?bookCode=<%=book.getBookCode()%>" class="detail-link">자세히 보기 / 수정</a>
                            </div>
                <%
                            displayCount--;
                        }
                    }
                %>
            </div>
            <div class="view-all-link">
                <a href="./BookList.jsp">모든 도서 목록 보기 &gt;</a>
            </div>
        </div>

        <div class="quick-links-section">
            <h2>빠른 메뉴</h2>
            <div class="links-grid">
                <a href="./register.jsp" class="link-item">도서 등록</a>
                <a href="./search.jsp" class="link-item">도서 검색 (출판사)</a>
                <a href="./pubPrice.jsp" class="link-item">출판사별 매출</a>
            </div>
        </div>

    </div>
</section>

<%@include file= "./footer.jsp"%>