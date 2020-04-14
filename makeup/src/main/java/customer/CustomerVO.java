package customer;

public class CustomerVO {
	private String customer_id;
	private String customer_pw;
	private String customer_pwCk;
	private String customer_name;
	private String customer_SocialNum;
	private String customer_email;
	private String customer_phone[];
	private String customer_phones;
	private String customer_postcode;
	private String customer_address[];
	private String customer_addresses;
	
	public String getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
	public String getCustomer_pw() {
		return customer_pw;
	}
	public void setCustomer_pw(String customer_pw) {
		this.customer_pw = customer_pw;
	}
	public String getCustomer_pwCk() {
		return customer_pwCk;
	}
	public void setCustomer_pwCk(String customer_pwCk) {
		this.customer_pwCk = customer_pwCk;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public String getCustomer_SocialNum() {
		return customer_SocialNum;
	}
	public void setCustomer_SocialNum(String customer_SocialNum) {
		this.customer_SocialNum = customer_SocialNum;
	}
	public String getCustomer_email() {
		return customer_email;
	}
	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}
	public String[] getCustomer_phone() {
		return customer_phone;
	}
	public void setCustomer_phone(String[] customer_phone) {
		this.customer_phone = customer_phone;
		customer_phones = String.join("-", customer_phone);	// 배열에 담을 때 customer_phones에 '-'를 함께 담는다
	}
	public String getCustomer_phones() {
		return customer_phones;
	}
	public void setCustomer_phones(String customer_phones) {
		this.customer_phones = customer_phones;
		customer_phone = customer_phones.split("-");	// customer_phones에서 '-'를 제거한 문자를 customer_phone에 담는다
	}
	public String getCustomer_postcode() {
		return customer_postcode;
	}
	public void setCustomer_postcode(String customer_postcode) {
		this.customer_postcode = customer_postcode;
	}
	public String[] getCustomer_address() {
		return customer_address;
	}
	public void setCustomer_address(String[] customer_address) {
		this.customer_address = customer_address;
	}
	public String getCustomer_addresses() {
		return customer_addresses;
	}
	public void setCustomer_addresses(String customer_addresses) {
		this.customer_addresses = customer_addresses;
	}

}
