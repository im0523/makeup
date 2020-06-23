package com.hanul.makeup;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CartController {
	

	// 장바구니 추가
	@ResponseBody @RequestMapping("/insert.ct")
	public void cart_insert() {
		System.out.println("타나");
	}
}
