package Book;

public class PriceVO {
	String bpub; // 출판사 이름. 매출을 집계하는 기준이 되는 출판사 이름.
	int price;   // 총 매출액. 해당 출판사의 도서 판매 총액.
	int count;   // 총 도서 수량. 해당 출판사의 판매된 도서 총 개수.

	// 기본 생성자. 객체를 만들 때 초기 설정을 함.
	public PriceVO() {
		super();
	}

	// 모든 필드를 파라미터로 받는 생성자.
	// 출판사별 매출 정보를 담은 객체를 만들 때 사용.
	public PriceVO(String bpub, int price, int count) {
		super();
		this.bpub = bpub;
		this.price = price;
		this.count = count;
	}

	// bpub(출판사 이름) 값을 가져오는 기능.
	public String getBpub() {
		return bpub;
	}
	// bpub(출판사 이름) 값을 설정하는 기능.
	public void setBpub(String bpub) {
		this.bpub = bpub;
	}

	// price(총 매출액) 값을 가져오는 기능.
	public int getPrice() {
		return price;
	}
	// price(총 매출액) 값을 설정하는 기능.
	public void setPrice(int price) {
		this.price = price;
	}

	// count(총 도서 수량) 값을 가져오는 기능.
	public int getCount() {
		return count;
	}
	// count(총 도서 수량) 값을 설정하는 기능.
	public void setCount(int count) {
		this.count = count;
	}

	// 객체의 필드 값들을 문자열로 반환하는 기능.
	// 주로 디버깅할 때 객체의 상태를 쉽게 확인하려고 사용.
	@Override
	public String toString() {
		return "PriceVO [bpub=" + bpub + ", price=" + price + ", count=" + count + "]";
	}
}