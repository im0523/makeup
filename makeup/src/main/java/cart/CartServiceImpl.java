package cart;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CartServiceImpl implements CartService {
	@Autowired private CartDAO dao;

	// 장바구니 리스트 가져오기
	@Override
	public int cart_select(CartVO cartVo) {
		return dao.cart_select(cartVo);
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
