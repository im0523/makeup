package com.hanul.makeup;

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
	public void cart_insert(CartVO cartVo) {
		service.cart_insert(cartVo);
	}
}
