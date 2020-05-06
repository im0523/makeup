package product;

public interface ProductService {
	//CRUD
	ProductPageVO product_list(ProductPageVO page);
	ProductVO product_detail(int product_no);
	void product_insert(ProductVO vo);
	void product_update(ProductVO vo);
	void product_delete(int product_no);
}
