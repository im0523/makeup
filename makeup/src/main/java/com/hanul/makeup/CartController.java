package com.hanul.makeup;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cart.CartServiceImpl;
import cart.CartVO;

@Controller
public class CartController {
	@Autowired private CartServiceImpl service;

	// 장바구니 추가
	@ResponseBody @RequestMapping("/insert.ct")
	public HashMap<String, Integer> cart_insert(CartVO cartVo, String customer_id) {
		HashMap<String, Integer> map = new HashMap<>();

		int result = service.cart_select(cartVo);
		
		if( !customer_id.equals("")) {		// 로그인을 했을 때
			// 로그인 한 사용자가 해당 물건을 장바구니에 넣은적이 있을 경우
			if( result > 0 ) {
				System.out.println("찍어보기 1");
				service.cart_update(cartVo);
			}else {
				// 로그인 한 사용자가 해당 물품을 장바구니에 담은 적이 없을 경우
				System.out.println("찍어보기 2");
				service.cart_insert(cartVo);
			}
		}else {								// 로그인 한 상태가 아니면
			System.out.println("찍어보기 3");
			service.cart_insert(cartVo);	// insert
		}
		
		return map;
	}
}
