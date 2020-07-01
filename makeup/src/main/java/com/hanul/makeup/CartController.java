package com.hanul.makeup;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

		if( !customer_id.isEmpty() ) {		// 로그인을 했을 때
			CartVO result = service.cart_select(cartVo);
			
			if( result != null ) {
				service.cart_update(cartVo);
			}else {
				// 로그인 한 사용자가 해당 물품을 장바구니에 담은 적이 없을 경우
				service.cart_insert(cartVo);
			}
		}else {								// 로그인 한 상태가 아니면
			service.cart_insert(cartVo);	// insert
		}
		
		return map;
	}
	
	// 장바구니 리스트 출력
	@RequestMapping("/list.ct")
	public String cart_list(Model model, String customer_id) {
		List<CartVO> list = service.cart_select(customer_id);
		model.addAttribute("list", list);
		return "cart/list";
	}
}
