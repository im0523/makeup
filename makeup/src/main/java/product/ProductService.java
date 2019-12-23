package product;

public interface ProductService {
	//CRUD
	ProductPageVO product_list(ProductPageVO page);
	ProductVO product_detail(int no);
	void product_insert(ProductVO vo);
	void product_update(ProductVO vo);
	void product_delete(int no);
}
