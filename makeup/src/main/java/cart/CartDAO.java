package cart;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO implements CartService {
	@Autowired private SqlSession sql;

	@Override
	public int cart_insert(CartVO cartVo) {
		return 0;
	}

}
