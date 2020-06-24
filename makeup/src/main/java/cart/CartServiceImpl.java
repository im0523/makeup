package cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService {
	@Autowired private CartDAO dao;

	// 장바구니 추가
	@Override
	public int cart_insert(CartVO cartVo) {
		return dao.cart_insert(cartVo);
	}

}
