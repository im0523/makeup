package com.hanul.makeup;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
//		model.addAttribute("page", service.customer_list(page));
		return "customer/list";
	}
	
	// customer insert 화면
	@RequestMapping("/new.cu")
	public String customer() {
		return "customer/new";
	}
	
	// customer insert 처리
	@RequestMapping("/insert.cu")
	public String insert(CustomerVO vo, HttpSession ss) {
		service.customer_insert(vo);
		return "redirect:list.cu";
	}
}
