package product;

import java.util.List;

import image.ImageVO;

public interface ProductService {
	ProductPageVO product_list(ProductPageVO page);	// 상품 리스트 출력
	
	ProductVO product_detail(int product_no);	// 상품 상세보기
	List<ImageVO> image_detail(int product_no);	// 상품 상세보기
	
	int product_insert(ProductVO productVo);	// 상품등록
	void image_insert(ImageVO imageVo);			// 상품등록
	
	void product_update(ProductVO vo);
	
	void product_delete(int product_no);		// 상품 삭제
}
