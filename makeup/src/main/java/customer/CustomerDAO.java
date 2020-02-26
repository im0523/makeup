package customer;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CustomerDAO implements CustomerService {
	@Autowired SqlSession sql;

	@Override
	public CustomerPageVO customer_list(CustomerPageVO page) {
		List<CustomerVO> list = sql.selectList("customer.mapper.list", page);
		page.setList(list);
		return page;
	}

	@Override
	public CustomerVO customer_detail(int no) {
		return null;
	}

	@Override
	public void customer_insert(CustomerVO vo) {
		sql.insert("customer.mapper.insert", vo);
	}

	@Override
	public void customer_update(CustomerVO vo) {

	}

	@Override
	public void customer_delete(int no) {

	}

}
