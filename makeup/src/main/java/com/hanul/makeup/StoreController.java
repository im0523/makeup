package com.hanul.makeup;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import common.CommonService;
import store.StorePageVO;
import store.StoreServiceImpl;
import store.StoreVO;

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
	
	//신규 게시글 작성화면 요청
	@RequestMapping("/new.st")
	public String store() {
		return "store/new";
	}
	
	//신규 게시글 저장처리 요청
	@RequestMapping("/insert.st")
	public String insert(StoreVO vo, HttpSession ss, MultipartFile file) {
		//첨부파일이 있는 경우
		if( file.getSize() > 0 ) {
			vo.setFilename( file.getOriginalFilename() );
			vo.setFilepath( common.fileUpload(file, ss, "store") );
		}
		service.store_insert(vo);
		return "redirect:list.st";
	}
}
