package customer;

public interface CustomerService {
	//CRUD
	CustomerPageVO customer_list(CustomerPageVO page);
	CustomerVO customer_detail(int no);
	void customer_insert(CustomerVO vo);
	void customer_update(CustomerVO vo);
	void customer_delete(int no);
	
	int id_usable(String customer_id);	//아이디 중복확인(이 아이디를 사용할 수 있다 or 없다 니까 boolean)
}
