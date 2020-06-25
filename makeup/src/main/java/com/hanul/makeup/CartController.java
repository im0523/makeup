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
	public HashMap<String, Integer> cart_insert(CartVO cartVo) {
		HashMap<String, Integer> map = new HashMap<>();
		service.cart_insert(cartVo);
		
		return map;
	}
}
