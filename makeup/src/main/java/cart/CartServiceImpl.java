package cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cart.CartService;
import cart.CartVO;

@Service
public class CartServiceImpl implements CartService {
	@Autowired private CartDAO dao;

	// 장바구니 추가
	@Override
	public int cart_insert(CartVO cartVo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
