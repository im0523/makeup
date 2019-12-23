package product;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAO implements ProductService {
	@Autowired private SqlSession sql;

	@Override
	public ProductPageVO product_list(ProductPageVO page) {
		List<ProductVO> list = sql.selectList("product.mapper.list", page);
		page.setList(list);
		return page;
	}

	@Override
	public ProductVO product_detail(int no) {
		return sql.selectOne("product.mapper.detail", no);
	}

	@Override
	public void product_insert(ProductVO vo) {
		sql.insert("product.mapper.insert", vo);
	}

	@Override
	public void product_update(ProductVO vo) {

	}

	@Override
	public void product_delete(int no) {

	}

}
