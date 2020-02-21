package com.hanul.makeup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.CommonService;
import customer.CustomerPageVO;
import customer.CustomerServiceImpl;

@Controller
public class CustomerController {
	@Autowired CustomerPageVO page;
	@Autowired CustomerServiceImpl service;
	@Autowired CommonService common;
	
	@RequestMapping("/list.cu")
	public String list(Model model) {
		model.addAttribute("page", service.customer_list(page));
		return "customer/list";
	}
}
