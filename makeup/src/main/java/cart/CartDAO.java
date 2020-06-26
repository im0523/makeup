package cart;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO implements CartService {
	@Autowired SqlSession sql;

	// 장바구니 리스트 가져오기
	@Override
	public int cart_select(CartVO cartVo) {
		return sql.selectOne("cart.mapper.list", cartVo);
	}

	// 장바구니 추가
	@Override
	public int cart_insert(CartVO cartVo) {
		return sql.insert("cart.mapper.insert", cartVo);
	}

	// 로그인 한 사용자의 장바구니 물품 수정
	@Override
	public int cart_update(CartVO cartVo) {
		return sql.update("cart.mapper.update", cartVo);
	}
}
