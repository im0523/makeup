package cart;

public interface CartService {
	int cart_select(CartVO cartVo);		// 장바구니 리스트 가져오기
	int cart_insert(CartVO cartVo);		// 장바구니 추가
	int cart_update(CartVO cartVo);	// 로그인 한 사용자의 장바구니 물품 수정
}
