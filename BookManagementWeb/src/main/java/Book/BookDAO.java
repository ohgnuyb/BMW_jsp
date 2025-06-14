package Book;

import java.util.ArrayList;
import java.util.HashMap; 
import java.util.Map;   

public class BookDAO {

	public static ArrayList<BookVO> bookList = new ArrayList<BookVO>();


	public void updateBook(int bookCode, String bookName, String bookWriter, String publisher, int price, String date) {
		for (int i = 0; i < bookList.size(); i++) {
			if(bookCode == bookList.get(i).getBookCode()) {
		
				BookVO vo = new BookVO(bookCode, bookName, bookWriter, publisher, price, date);
				bookList.set(i, vo);
				return; 
			}
		}
	}

	public void deleteBook(int bookCode) {
		for (int i = 0; i < bookList.size(); i++) {
			if(bookCode == bookList.get(i).getBookCode()) {
				bookList.remove(i);
				return; 
			}
		}
	}

	public ArrayList<BookVO> searchPro(String publisherName) {
		ArrayList<BookVO> searchList = new ArrayList<BookVO>();

		String searchLower = publisherName.toLowerCase();
		for (int i = 0; i < bookList.size(); i++) {

			if(bookList.get(i).getPublisher().toLowerCase().contains(searchLower)) {
				searchList.add(bookList.get(i));
			}
		}
		return searchList;
	}


	public ArrayList<PriceVO> pubPrice() {
		ArrayList<PriceVO> priceList = new ArrayList<PriceVO>();

		Map<String, PriceVO> publisherSales = new HashMap<>();

		for (int i = 0; i < bookList.size(); i++) {
			String publisherName = bookList.get(i).getPublisher();
			int price = bookList.get(i).getPrice();

			PriceVO currentPriceVO = publisherSales.getOrDefault(publisherName, new PriceVO(publisherName, 0, 0));
			currentPriceVO.setPrice(currentPriceVO.getPrice() + price);
			currentPriceVO.setCount(currentPriceVO.getCount() + 1);
			publisherSales.put(publisherName, currentPriceVO);
		}


		priceList.addAll(publisherSales.values());
		return priceList;
	}

	public int updatei(int bookCode) {
		for (int i = 0; i < bookList.size(); i++) {
			if (bookCode == bookList.get(i).getBookCode()) {
				return i; 
			}
		}
		return -1; 
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


	public void addBook(int bookCode, String bookName, String bookWriter, String publisher, int price, String date) {

		BookVO vo = new BookVO(bookCode, bookName, bookWriter, publisher, price, date);
		bookList.add(vo);
		System.out.println(bookList.toString());
	}

	public String getDate() {
		String date = "yyyy-mm-dd";
		return date;
	}
}