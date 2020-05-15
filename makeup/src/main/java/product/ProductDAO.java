package product;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import image.ImageVO;

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
	public ProductVO product_detail(int product_no) {
		return sql.selectOne("product.mapper.detail", product_no);
	}

	@Override
	public void product_insert(ProductVO vo) {
		sql.insert("product.mapper.insert", vo);
	}
	
	@Override
	public void image_insert(ImageVO vo) {
		sql.insert("image.mapper.insert", vo);
	}

	@Override
	public void product_update(ProductVO vo) {
		sql.update("product.mapper.update", vo);
	}

	@Override
	public void product_delete(int product_no) {
		sql.delete("product.mapper.delete", product_no);
	}

}
