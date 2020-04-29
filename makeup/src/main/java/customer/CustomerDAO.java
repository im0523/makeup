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
		page.setTotalList( sql.selectOne("customer.mapper.totalCount", page) );
		List<CustomerVO> list = sql.selectList("customer.mapper.list", page);
		page.setList(list);
		return page;
	}

	@Override
	public CustomerVO customer_detail(String customer_id) {
		return sql.selectOne("customer.mapper.detail", customer_id);
	}

	@Override
	public void customer_insert(CustomerVO vo) {
		sql.insert("customer.mapper.insert", vo);
	}

	@Override
	public void customer_update(CustomerVO vo) {
		sql.update("customer.mapper.update", vo);
	}

	@Override
	public void customer_delete(int no) {

	}

	// 아이디 중복검사
	@Override
	public boolean id_usable(String customer_id) {
		// 1이면 아이디가 이미 존재해서 사용할 수 없고, 0이면 사용가능
		return (Integer)sql.selectOne("customer.mapper.idUsable", customer_id) == 1 ? false : true;
	}

}
