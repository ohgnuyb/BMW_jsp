package Book;

public class BookVO {
	int bookCode;
	String bookName;
	String bookWriter;
	String publisher; 
	int price;
	String date;

	public BookVO() {
		super();
	}


	public BookVO(int bookCode, String bookName, String bookWriter, String publisher, int price, String date) {
		super();
		this.bookCode = bookCode;
		this.bookName = bookName;
		this.bookWriter = bookWriter;
		this.publisher = publisher;
		this.price = price;
		this.date = date;
	}

	public int getBookCode() {
		return bookCode;
	}
	public void setBookCode(int bookCode) {
		this.bookCode = bookCode;
	}
	public String getBookName() {
		return bookName;
	}
	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	public String getBookWriter() {
		return bookWriter;
	}
	public void setBookWriter(String bookWriter) {
		this.bookWriter = bookWriter;
	}

	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "BookVO [bookCode=" + bookCode + ", bookName=" + bookName + ", bookWriter=" + bookWriter + ", publisher="
				+ publisher + ", price=" + price + ", date=" + date + "]";
	}
}