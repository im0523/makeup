package cart;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO implements CartService {
	@Autowired SqlSession sql;

	@Override
	public int cart_insert(CartVO cartVo) {
		return sql.insert("cart.mapper.insert", cartVo);
	}

}
