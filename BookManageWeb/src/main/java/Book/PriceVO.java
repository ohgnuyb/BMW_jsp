package Book;

public class PriceVO {
	int bpub;
	int price;
	int count;
	
	
	
	public PriceVO() {
		super();
	}
	
	public PriceVO(int bpub, int price, int count) {
		super();
		this.bpub = bpub;
		this.price = price;
		this.count = count;
	}
	public int getBpub() {
		return bpub;
	}
	public void setBpub(int bpub) {
		this.bpub = bpub;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		return "PriceVO [bpub=" + bpub + ", price=" + price + ", count=" + count + "]";
	}
	
	
	
}
