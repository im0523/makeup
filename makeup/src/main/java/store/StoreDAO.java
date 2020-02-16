package store;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StoreDAO implements StoreService {
	@Autowired private SqlSession sql;

	@Override
	public StorePageVO store_list(StorePageVO page) {
		List<StoreVO> list = sql.selectList("store.mapper.list", page);
		page.setList(list);
		return page;
	}

	@Override
	public StoreVO store_detail(int id) {
		return sql.selectOne("store.mapper.detail", id);
	}

	@Override
	public void store_insert(StoreVO vo) {
		sql.insert("store.mapper.insert", vo);
	}

	@Override
	public void store_update(StoreVO vo) {
		sql.update("store.mapper.update", vo);
	}

	@Override
	public void store_delete(int id) {
		sql.delete("store.mapper.delete", id);
	}

	@Override
	public void store_read(int id) {

	}

}
