package customer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerServiceImpl implements CustomerService {
	@Autowired CustomerDAO dao;

	// customer list 조회
	@Override
	public CustomerPageVO customer_list(CustomerPageVO page) {
		return dao.customer_list(page);
	}

	@Override
	public CustomerVO customer_detail(int no) {
		return null;
	}

	// customer 등록
	@Override
	public void customer_insert(CustomerVO vo) {
		dao.customer_insert(vo);
	}

	@Override
	public void customer_update(CustomerVO vo) {

	}

	@Override
	public void customer_delete(int no) {

	}

	// 아이디 중복검사
	@Override
	public int id_usable(String customer_id) {
		return dao.id_usable(customer_id);
	}

}
