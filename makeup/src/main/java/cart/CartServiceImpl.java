package cart;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService {
	@Autowired private CartDAO dao;

	// 장바구니 목록 가져오기
	@Override
	public CartVO cart_select(CartVO cartVo) {
		return dao.cart_select(cartVo);
	}
	
	// 로그인 한 사람의 장바구니 목록 가져오기
	@Override
	public List<CartVO> cart_select(String customer_id) {
		return dao.cart_select(customer_id);
	}

	// 장바구니 추가
	@Override
	public int cart_insert(CartVO cartVo) {
		return dao.cart_insert(cartVo);
	}

	// 로그인 한 사용자의 장바구니 물품 수정
	public int cart_update(CartVO cartVo) {
		return dao.cart_update(cartVo);
		
	}

	

}
