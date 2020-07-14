package cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO implements CartService {
	@Autowired SqlSession sql;

	// 장바구니 리스트 가져오기
	@Override
	public CartVO cart_select(CartVO cartVo) {
		return sql.selectOne("cart.mapper.list", cartVo);
	}

	// 로그인 한 사람의 장바구니 목록 가져오기
	@Override
	public List<CartVO> cart_select(String customer_id) {
		return sql.selectList("cart.mapper.userCartList", customer_id);
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

	// 장바구니의 선택상품 삭제
	@Override
	public int cart_delete(int cart_id) {
		return sql.delete("cart.mapper.delete", cart_id);
	}

	
}
