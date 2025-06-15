package Book;

public class BookVO {
	int bookCode;     // 도서 코드. 각 도서를 식별하는 번호.
	String bookName;  // 도서 제목. 책의 이름.
	String bookWriter; // 도서 저자. 책을 쓴 사람 이름.
	String publisher;  // 출판사 이름. 책을 출판한 곳 이름.
	int price;        // 도서 가격. 책의 판매 가격.
	String date;       // 등록 날짜. 도서가 시스템에 등록된 날짜.

	// 기본 생성자. 객체를 만들 때 초기 설정을 함.
	public BookVO() {
		super();
	}

	// 모든 필드를 파라미터로 받는 생성자.
	// 새 도서 객체를 한 번에 만들 때 사용.
	public BookVO(int bookCode, String bookName, String bookWriter, String publisher, int price, String date) {
		super();
		this.bookCode = bookCode;
		this.bookName = bookName;
		this.bookWriter = bookWriter;
		this.publisher = publisher;
		this.price = price;
		this.date = date;
	}

	// bookCode 값을 가져오는 기능.
	public int getBookCode() {
		return bookCode;
	}
	// bookCode 값을 설정하는 기능.
	public void setBookCode(int bookCode) {
		this.bookCode = bookCode;
	}

	// bookName 값을 가져오는 기능.
	public String getBookName() {
		return bookName;
	}
	// bookName 값을 설정하는 기능.
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	// bookWriter 값을 가져오는 기능.
	public String getBookWriter() {
		return bookWriter;
	}
	// bookWriter 값을 설정하는 기능.
	public void setBookWriter(String bookWriter) {
		this.bookWriter = bookWriter;
	}

	// publisher 값을 가져오는 기능.
	public String getPublisher() {
		return publisher;
	}
	// publisher 값을 설정하는 기능.
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	// price 값을 가져오는 기능.
	public int getPrice() {
		return price;
	}
	// price 값을 설정하는 기능.
	public void setPrice(int price) {
		this.price = price;
	}

	// date 값을 가져오는 기능.
	public String getDate() {
		return date;
	}
	// date 값을 설정하는 기능.
	public void setDate(String date) {
		this.date = date;
	}

	// 객체의 필드 값들을 문자열로 반환하는 기능.
	// 주로 디버깅할 때 객체의 상태를 쉽게 확인하려고 사용.
	@Override
	public String toString() {
		return "BookVO [bookCode=" + bookCode + ", bookName=" + bookName + ", bookWriter=" + bookWriter + ", publisher="
				+ publisher + ", price=" + price + ", date=" + date + "]";
	}
}