package Book;

import java.util.ArrayList;
import java.util.HashMap; // Map 사용을 위한 임포트.
import java.util.Map;     // Map 인터페이스 사용을 위한 임포트.

public class BookDAO {

	// 모든 도서 정보를 저장하는 리스트. 인메모리(메모리 내) 데이터베이스 같은 기능.
	public static ArrayList<BookVO> bookList = new ArrayList<BookVO>();

	// 도서 정보를 업데이트하는 기능.
	// 특정 bookCode에 해당하는 도서의 다른 정보를 수정.
	public void updateBook(int bookCode, String bookName, String bookWriter, String publisher, int price, String date) {
		for (int i = 0; i < bookList.size(); i++) {
			if(bookCode == bookList.get(i).getBookCode()) { // 해당 bookCode를 찾음.

				BookVO vo = new BookVO(bookCode, bookName, bookWriter, publisher, price, date); // 새 정보로 VO 객체 생성.
				bookList.set(i, vo); // 리스트에서 해당 인덱스의 도서 정보를 새 VO로 교체.
				return; // 업데이트 후 바로 기능 종료.
			}
		}
	}

	// 도서 정보를 삭제하는 기능.
	// 특정 bookCode에 해당하는 도서를 리스트에서 제거.
	public void deleteBook(int bookCode) {
		for (int i = 0; i < bookList.size(); i++) {
			if(bookCode == bookList.get(i).getBookCode()) { // 해당 bookCode를 찾음.
				bookList.remove(i); // 리스트에서 해당 도서를 삭제.
				return; // 삭제 후 바로 기능 종료.
			}
		}
	}

	// 출판사 이름으로 도서를 검색하는 기능.
	// 검색어(publisherName)가 포함된 모든 도서를 찾아서 반환.
	public ArrayList<BookVO> searchPro(String publisherName) {
		ArrayList<BookVO> searchList = new ArrayList<BookVO>(); // 검색 결과를 담을 리스트.

		String searchLower = publisherName.toLowerCase(); // 검색어를 소문자로 변환. 대소문자 구분 없이 검색하려고.
		for (int i = 0; i < bookList.size(); i++) {

			// 도서의 출판사 이름을 소문자로 변환하고, 검색어가 포함되어 있는지 확인.
			if(bookList.get(i).getPublisher().toLowerCase().contains(searchLower)) {
				searchList.add(bookList.get(i)); // 검색 조건에 맞는 도서를 추가.
			}
		}
		return searchList; // 검색된 도서 리스트를 반환.
	}


	// 출판사별 총 매출과 도서 수량을 계산하는 기능.
	// 동적으로 모든 출판사의 매출을 집계.
	public ArrayList<PriceVO> pubPrice() {
		ArrayList<PriceVO> priceList = new ArrayList<PriceVO>(); // 최종 매출 집계 결과를 담을 리스트.
		// 출판사 이름을 키로, 해당 출판사의 매출/수량 정보를 담은 PriceVO 객체를 값으로 하는 Map.
		Map<String, PriceVO> publisherSales = new HashMap<>();

		for (int i = 0; i < bookList.size(); i++) { // 모든 도서 리스트를 순회.
			String publisherName = bookList.get(i).getPublisher(); // 도서의 출판사 이름을 가져옴.
			int price = bookList.get(i).getPrice(); // 도서의 가격을 가져옴.

			// Map에서 해당 출판사의 현재 매출 정보를 가져옴. 없으면 새로 PriceVO를 생성.
			PriceVO currentPriceVO = publisherSales.getOrDefault(publisherName, new PriceVO(publisherName, 0, 0));
			currentPriceVO.setPrice(currentPriceVO.getPrice() + price); // 기존 매출에 현재 도서 가격을 더함.
			currentPriceVO.setCount(currentPriceVO.getCount() + 1); // 도서 수량을 1 증가.
			publisherSales.put(publisherName, currentPriceVO); // 업데이트된 PriceVO를 Map에 다시 저장.
		}

		// Map에 저장된 모든 PriceVO 객체들을 리스트로 변환하여 반환.
		priceList.addAll(publisherSales.values());
		return priceList; // 출판사별 매출 정보 리스트를 반환.
	}

	// 특정 bookCode를 가진 도서의 리스트 내 인덱스를 찾는 기능.
	public int updatei(int bookCode) {
		for (int i = 0; i < bookList.size(); i++) {
			if (bookCode == bookList.get(i).getBookCode()) { // 해당 bookCode를 찾음.
				return i; // 찾으면 해당 인덱스를 반환.
			}
		}
		return -1; // 못 찾으면 -1을 반환.
	}


	// 새 도서 코드를 생성하는 기능.
	// 현재 리스트에 있는 가장 큰 bookCode에 1을 더해서 반환.
	public int getCode() {
		int code = 1000; // 초기 도서 코드값.
		for (int i = 0; i < bookList.size(); i++) {
			if(bookList.get(i).getBookCode() > code) { // 현재 도서 코드가 더 크면
				code = bookList.get(i).getBookCode(); // 가장 큰 코드를 업데이트함.
			}
		}
		return code+1; // 가장 큰 코드에 1을 더한 값을 반환해서 새 코드로 씀.
	}

	// 새로운 도서를 리스트에 추가하는 기능.
	public void addBook(int bookCode, String bookName, String bookWriter, String publisher, int price, String date) {
		// 받은 정보로 새 BookVO 객체를 생성.
		BookVO vo = new BookVO(bookCode, bookName, bookWriter, publisher, price, date);
		bookList.add(vo); // 리스트에 새 도서를 추가.
		System.out.println(bookList.toString()); // 추가된 도서 리스트를 콘솔에 출력해서 확인.
	}

	// 날짜 형식 문자열을 제공하는 기능.
	public String getDate() {
		String date = "yyyy-mm-dd"; // 날짜 형식을 나타내는 문자열.
		return date; // 이 문자열을 반환.
	}
}