package Book;

import java.util.ArrayList;

public class BookDAO {
	
	public static ArrayList<BookVO> bookList = new ArrayList<BookVO>();
	
	
	
	
	
	public void updateBook(int bookCode, String bookName, String bookWriter, int publisher, int price, String date) {
		for (int i = 0; i < bookList.size(); i++) {
			if(bookCode == bookList.get(i).getBookCode()) {
				BookVO vo = new BookVO(bookCode, bookName, bookWriter, publisher, price, date);
				bookList.set(i, vo);
			}
		}
	}
	
	public void deleteBook(int bookCode) {
		for (int i = 0; i < bookList.size(); i++) {
			if(bookCode == bookList.get(i).getBookCode()) {
				bookList.remove(i);
			}
		}
	}

	public ArrayList<BookVO> searchPro(int publisher) {
		ArrayList<BookVO> searchList = new ArrayList<BookVO>();
		for (int i = 0; i < bookList.size(); i++) {
			if(publisher == bookList.get(i).getPublisher()) {
				searchList.add(bookList.get(i));
			}
		}return searchList;
	}
	
	
	public ArrayList<PriceVO> pubPrice() {
		ArrayList<PriceVO> priceList = new ArrayList<PriceVO>();
		int price1001 = 0, count1001 = 0;
		int price1002 = 0, count1002 = 0;
		int price1003 = 0, count1003 = 0;
		int price1004 = 0, count1004 = 0;
		for (int i = 0; i < bookList.size(); i++) {
			if(bookList.get(i).getPublisher() == 1001) {
				price1001 += bookList.get(i).getPrice();
				count1001++;
			}else if(bookList.get(i).getPublisher() == 1002) {
				price1002 += bookList.get(i).getPrice();
				count1002++;
	
			}else if(bookList.get(i).getPublisher() == 1003) {
				price1003 += bookList.get(i).getPrice();
				count1003++;
			}else if(bookList.get(i).getPublisher() == 1004) {
				price1004 += bookList.get(i).getPrice();
				count1004++;
			}
		}
		if(count1001 == 0) {
		}else {
			PriceVO vo = new PriceVO(1001, price1001, count1001);
			priceList.add(vo);
		}
		if(count1002 == 0) {
			
		}else {
			PriceVO vo = new PriceVO(1002, price1002, count1002);
			priceList.add(vo);
		}
		if(count1003 == 0) {
			
		}else {
			PriceVO vo = new PriceVO(1003, price1003, count1003);
			priceList.add(vo);
		}
		if(count1004 == 0) {
			
		}else {
			PriceVO vo = new PriceVO(1004, price1004, count1004);
			priceList.add(vo);
		}
		
			
		return priceList;
	}
	
	
	public int updatei(int bookCode) {
		  for (int i = 0; i < bookList.size(); i++) {
		    if (bookCode == bookList.get(i).getBookCode()) {
		      return i; // bookCode를 찾으면 해당 인덱스를 반환
		    }
		  }
		  return -1; // bookCode를 찾지 못하면 -1을 반환
		}
	
	
	public String changePub(int publisher) {
		String pub = "";
		if(publisher == 1001) {
			pub = "영출판사";
		}else if(publisher == 1002) {
			pub = "북스미디어";
		}else if(publisher == 1003) {
			pub = "한아카데미";
		}else if(publisher == 1004) {
			pub = "이지스";
		}return pub;
	}

	public int getCode() {
		int code = 1000;
		for (int i = 0; i < bookList.size(); i++) {
			if(bookList.get(i).getBookCode() > code) {
				code = bookList.get(i).getBookCode();
			}
		}
		return code+1;
	}
	
	public void addBook(int bookCode, String bookName, String bookWriter, int publisher, int price, String date) {
		BookVO vo = new BookVO(bookCode, bookName, bookWriter, publisher, price, date);
		bookList.add(vo);
		System.out.println(bookList.toString());
	}
	
	public String getDate() {
		String date = "yyyy-mm-dd";
		return date;
	}
}
