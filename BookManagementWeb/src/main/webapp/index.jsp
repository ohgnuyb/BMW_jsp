<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>  <%-- ArrayList 사용을 위해 필요. --%>
<%@page import="Book.BookVO"%>           <%-- BookVO 객체 사용을 위해 필요. --%>
<%@page import="Book.BookDAO"%>           <%-- BookDAO 객체 사용을 위해 필요. --%>
<%@page import="java.text.DecimalFormat"%> <%-- 숫자 포맷팅을 위해 필요. --%>
<%@include file= "./header.jsp"%>       <%-- 공통 헤더 파일을 포함. --%>

<section class="main-section"> <%-- 페이지의 주요 콘텐츠 영역. --%>
    <div class="content-container home-content"> <%-- 홈 화면 콘텐츠를 담는 컨테이너. --%>

        <h1 class="main-title">도서 관리 시스템</h1> <%-- 메인 제목. --%>
        <p class="main-description"> <%-- 시스템에 대한 간략한 설명. --%>
            쉽고 빠르게 도서 정보를 등록, 조회, 수정하고 관리해보세요.
        </p>

        <div class="quick-search-section"> <%-- 빠른 검색 기능을 담는 섹션. --%>
            <h2>도서 검색</h2> <%-- 검색 섹션 제목. --%>
            <form action="./searchPro.jsp" class="search-form"> <%-- 검색 폼. searchPro.jsp로 데이터를 전송. --%>
                <input type="text" name="publisherSearch" placeholder="검색할 출판사명 입력" class="search-input"> <%-- 출판사명 검색 입력 필드. --%>
                <button type="submit" class="search-button">검색</button> <%-- 검색 버튼. --%>
            </form>
        </div>

        <div class="recent-books-section"> <%-- 최근 추가된 도서를 보여주는 섹션. --%>
            <h2>최근 추가된 도서</h2> <%-- 최근 도서 섹션 제목. --%>
            <div class="book-list-preview"> <%-- 도서 카드들을 미리 보여주는 컨테이너. --%>
                <%
                    BookDAO dao = new BookDAO(); // BookDAO 객체를 생성.
                    ArrayList<BookVO> allBooks = dao.bookList; // 모든 도서 목록을 가져옴.
                    int displayCount = 3; // 홈 화면에 보여줄 최근 도서의 개수.

                    if (allBooks.isEmpty()) { // 도서 목록이 비어있는지 확인.
                %>
                        <p class="no-books-message">아직 등록된 도서가 없습니다. 지금 바로 도서를 등록해보세요!</p> <%-- 도서가 없을 때 메시지. --%>
                <%
                    } else { // 도서 목록이 있다면
                        // 최근 추가된 도서부터 표시하기 위해 리스트를 역순으로 순회.
                        DecimalFormat df = new DecimalFormat("#,###"); // 가격을 쉼표 형식으로 포맷하기 위해 사용.
                        for (int i = allBooks.size() - 1; i >= 0 && displayCount > 0; i--) { // 리스트의 뒤에서부터 지정된 개수만큼 순회.
                            BookVO book = allBooks.get(i); // 현재 도서 객체를 가져옴.
                %>
                            <div class="book-card"> <%-- 각 도서의 정보를 표시하는 카드. --%>
                                <h3><%= book.getBookName() %></h3> <%-- 도서 제목. --%>
                                <p><strong>저자:</strong> <%= book.getBookWriter() %></p> <%-- 도서 저자 정보. --%>
                                <p><strong>출판사:</strong> <%= book.getPublisher() %></p> <%-- 출판사 정보. --%>
                                <p><strong>가격:</strong> <%= df.format(book.getPrice()) %>원</p> <%-- 가격을 포맷하여 표시. --%>
                                <a href="./update.jsp?bookCode=<%=book.getBookCode()%>" class="detail-link">자세히 보기 / 수정</a> <%-- 도서 수정 페이지로 가는 링크. --%>
                            </div>
                <%
                            displayCount--; // 표시할 도서 개수를 줄임.
                        }
                    }
                %>
            </div>
            <div class="view-all-link"> <%-- 모든 도서 목록 보기 링크 컨테이너. --%>
                <a href="./BookList.jsp">모든 도서 목록 보기 &gt;</a> <%-- 모든 도서 목록 페이지로 가는 링크. --%>
            </div>
        </div>

        <div class="quick-links-section"> <%-- 주요 기능으로 바로 갈 수 있는 링크 섹션. --%>
            <h2>빠른 메뉴</h2> <%-- 빠른 메뉴 섹션 제목. --%>
            <div class="links-grid"> <%-- 링크들을 그리드 형태로 배치하는 컨테이너. --%>
                <a href="./register.jsp" class="link-item">도서 등록</a>       <%-- 도서 등록 페이지로 가는 링크. --%>
                <a href="./search.jsp" class="link-item">도서 검색 (출판사)</a> <%-- 도서 검색 페이지로 가는 링크. --%>
                <a href="./pubPrice.jsp" class="link-item">출판사별 매출</a>   <%-- 출판사별 매출 조회 페이지로 가는 링크. --%>
            </div>
        </div>

    </div>
</section>

<%@include file= "./footer.jsp"%>