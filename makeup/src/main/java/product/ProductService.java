package product;

import image.ImageVO;

public interface ProductService {
	ProductPageVO product_list(ProductPageVO page);
	ProductVO product_detail(int product_no);
	int product_insert(ProductVO productVo);	// 상품등록
	void image_insert(ImageVO imageVo);			// 상품등록
	void product_update(ProductVO vo);
	void product_delete(int product_no);
}
