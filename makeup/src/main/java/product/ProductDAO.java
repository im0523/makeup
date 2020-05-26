package product;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import image.ImageVO;

@Repository
public class ProductDAO implements ProductService {
	@Autowired private SqlSession sql;

	// 상품 리스트 출력
	@Override
	public ProductPageVO product_list(ProductPageVO page) {
		List<ProductVO> list = sql.selectList("product.mapper.list", page);
		page.setList(list);
		return page;
	}

	// 상품 상세보기
	@Override
	public ProductVO product_detail(int product_no) {
		return sql.selectOne("product.mapper.detail", product_no);
	}
	
	// 상품 상세보기 - 이미지
	@Override
	public List<ImageVO> image_detail(int product_no) {
		return sql.selectList("image.mapper.detail", product_no);
	}

	// 상품등록
	@Override
	public int product_insert(ProductVO vo) {
		return sql.insert("product.mapper.insert", vo);
	}
	
	// 상품등록 - 이미지
	@Override
	public void image_insert(ImageVO vo) {
		sql.insert("image.mapper.insert", vo);
	}

	// 상품수정
	@Override
	public int product_update(ProductVO productVo) {
		return sql.update("product.mapper.update", productVo);
	}

	// 상품 삭제
	@Override
	public void product_delete(int product_no) {
		sql.delete("product.mapper.delete", product_no);
		sql.delete("image.mapper.delete", product_no);
	}

	// 상품 삭제 - 이미지
	@Override
	public int image_delete(int product_no) {
		return sql.delete("image.mapper.delete", product_no);
	}

	

}
