package product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductServiceImpl implements ProductService {
	@Autowired private ProductDAO dao;

	@Override
	public ProductPageVO product_list(ProductPageVO page) {
		return dao.product_list(page);
	}

	@Override
	public ProductVO product_detail(int no) {
		return dao.product_detail(no);
	}

	@Override
	public void product_insert(ProductVO vo) {
		dao.product_insert(vo);
	}

	@Override
	public void product_update(ProductVO vo) {

	}

	@Override
	public void product_delete(int no) {
		dao.product_delete(no);
	}

}
