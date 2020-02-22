package customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired CustomerDAO dao;

	@Override
	public CustomerPageVO customer_list(CustomerPageVO page) {
		return dao.customer_list(page);
	}

	@Override
	public CustomerVO customer_detail(int no) {
		return null;
	}

	@Override
	public void customer_insert(CustomerVO vo) {

	}

	@Override
	public void customer_update(CustomerVO vo) {

	}

	@Override
	public void customer_delete(int no) {

	}

}
