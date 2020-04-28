package com.hanul.makeup;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String list(Model model) {
		model.addAttribute("page", service.customer_list(page));
		return "customer/list";
	}
	
	// customer insert 화면
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
	
	// customer detail 화면
	@RequestMapping("/detail.cu")
	public String detail(Model model, String customer_id) {
		
		model.addAttribute("vo", service.customer_detail(customer_id));
		
		return "customer/detail";
	}
}
