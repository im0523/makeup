package com.hanul.makeup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import common.CommonService;
import customer.CustomerPageVO;
import customer.CustomerServiceImpl;
import customer.CustomerVO;

@Controller
public class CustomerController {
	@Autowired CustomerPageVO page;
	@Autowired CustomerServiceImpl service;
	@Autowired CommonService common;
	
	// customer list 조회
	@RequestMapping("/list.cu")
	public String list(Model model, @RequestParam(defaultValue = "1") int curPage) {
		
		page.setCurPage(curPage);	// curpage 기본 값을 1로 set 해준다
		
		model.addAttribute("page", service.customer_list(page));
//		System.out.println("curPage값 : " + page.getCurPage());
//		System.out.println("beginList값 : " + page.getBeginList());
//		System.out.println("endList값 : " + page.getEndList());
		return "customer/list";
	}
	
	// customer insert 화면 요청
	@RequestMapping("/new.cu")
	public String customer() {
		return "customer/new";
	}
	
	// customer insert 처리
	@RequestMapping("/insert.cu")
	public String insert(CustomerVO vo) {
		service.customer_insert(vo);
		return "redirect:list.cu";
	}
	
	// id 중복검사
	@ResponseBody @RequestMapping("/id_usable")
	public String id_usable(String customer_id) {
		return String.valueOf(service.id_usable(customer_id));
	}
	
	// customer detail 화면 요청
	@RequestMapping("/detail.cu")
	public String detail(Model model, String customer_id) {
		model.addAttribute("vo", service.customer_detail(customer_id));
		model.addAttribute("page", page);
		return "customer/detail";
	}
	
	// customer 수정 화면 요청
	@RequestMapping("/modify.cu")
	public String modify(Model model, String customer_id) {
		model.addAttribute("vo", service.customer_detail(customer_id));
		return "customer/modify";
	}
	
	// customer 수정 처리 요청
	@RequestMapping("/update.cu")
	public String update(CustomerVO vo, Model model, String customer_id) {
		service.customer_update(vo);
		model.addAttribute("customer_id", vo.getCustomer_id());
		return "redirect:detail.cu";
	}
	
	// login 화면 요청
	@RequestMapping("/login")
	public String login() {
		return "customer/login";
	}
}
