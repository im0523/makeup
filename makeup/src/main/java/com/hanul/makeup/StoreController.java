package com.hanul.makeup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.CommonService;
import store.StorePageVO;
import store.StoreServiceImpl;

@Controller
public class StoreController {
	@Autowired private StorePageVO page;
	@Autowired private StoreServiceImpl service;
	@Autowired private CommonService common;
	
	//게시글 목록화면 요청
	@RequestMapping("/list.st")
	public String list(Model model) {
		model.addAttribute("page", service.store_list(page));
		return "store/list";
	}
	
	//게시글 상세화면 요청
	@RequestMapping("/detail.st")
	public String detail(Model model, int id) {
		model.addAttribute("vo", service.store_detail(id));
		return "store/detail";
	}
	
	//게시글 등록화면 요청
	@RequestMapping("/new.st")
	public String insert() {
		return "store/new";
	}
}
