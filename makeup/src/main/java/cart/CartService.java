package cart;

import java.util.List;

public interface CartService {
	CartVO cart_select(CartVO cartVo);		// 장바구니 목록 가져오기
	List<CartVO> cart_select(String customer_id);	// 로그인 한 사람의 장바구니 목록 가져오기
	int cart_insert(CartVO cartVo);			// 장바구니 추가
	int cart_update(CartVO cartVo);			// 로그인 한 사용자의 장바구니 물품 수정
}
