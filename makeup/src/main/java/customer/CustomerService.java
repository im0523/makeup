package customer;

public interface CustomerService {
	//CRUD
	CustomerPageVO customer_list(CustomerPageVO page);
	CustomerVO customer_detail(int no);
	void customer_insert(CustomerVO vo);
	void customer_update(CustomerVO vo);
	void customer_delete(int no);
}
