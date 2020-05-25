package product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import image.ImageVO;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired private ProductDAO dao;

	// 상품 리스트 출력
	@Override
	public ProductPageVO product_list(ProductPageVO page) {
		return dao.product_list(page);
	}

	// 상품 상세보기
	@Override
	public ProductVO product_detail(int product_no) {
		return dao.product_detail(product_no);
	}
	
	// 상품 상세보기 - 이미지
	public List<ImageVO> image_detail(int product_no) {
		return dao.image_detail(product_no);
	}

	// 상품 등록
	@Override
	public int product_insert(ProductVO productVo) {
		int result = dao.product_insert(productVo);
		
		return result;
	}
	
	// 상품 등록 - 이미지
	@Override
	public void image_insert(ImageVO imageVo) {
		dao.image_insert(imageVo);
	}

	@Override
	public int product_update(ProductVO productVo) {
		return dao.product_update(productVo);
	}

	// 상품 삭제
	@Override
	public void product_delete(int product_no) {
		dao.product_delete(product_no);
	}

	
	
}
