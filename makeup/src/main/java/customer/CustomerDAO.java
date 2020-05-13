package customer;

import java.util.HashMap;
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
	public void customer_delete(String customer_id) {
		sql.delete("customer.mapper.delete", customer_id);
	}

	// 아이디 중복검사
	@Override
	public boolean id_usable(String customer_id) {
		// 1이면 아이디가 이미 존재해서 사용할 수 없고, 0이면 사용가능
		return (Integer)sql.selectOne("customer.mapper.idUsable", customer_id) == 1 ? false : true;
	}


	// 로그인 처리
	@Override
	public CustomerVO login_check(String customer_id, String customer_pw) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("customer_id", customer_id);
		map.put("customer_pw", customer_pw);
		
		return sql.selectOne("customer.mapper.loginCheck", map);
	}

	// email로 아이디 찾기
	@Override
	public CustomerVO findId_email(String customer_name, String customer_email) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("customer_name", customer_name);
		map.put("customer_email", customer_email);

		return sql.selectOne("customer.mapper.findId_email", map);
	}

	// phone으로 아이디 찾기
	@Override
	public CustomerVO findId_phone(String customer_name, String customer_phone) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("customer_name", customer_name);
		map.put("customer_phone", customer_phone);

		return sql.selectOne("customer.mapper.findId_phone", map);
	}

}
