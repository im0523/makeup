package cart;

public class CartVO {
	private int cart_id;
	private int product_no;
	private int amount;
	private String customer_id;

	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
}
