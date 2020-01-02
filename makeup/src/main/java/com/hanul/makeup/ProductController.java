package com.hanul.makeup;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import common.CommonService;
import product.ProductPageVO;
import product.ProductServiceImpl;
import product.ProductVO;

@Controller
public class ProductController {
	@Autowired private ProductPageVO page;
	@Autowired private ProductServiceImpl service;
	@Autowired private CommonService common;

	//상품 목록화면 요청
	@RequestMapping("/list.pd")
	public String list(Model model) {
		model.addAttribute("page", service.product_list(page));
		return "product/list";
	}
	
	//상품 등록화면 요청
	@RequestMapping("/new.pd")
	public String product(Model model) {
		return "product/new";
	}
	
	//상품 등록처리 요청
	@RequestMapping("/insert.pd")
	public String insert(ProductVO vo, HttpSession ss, MultipartFile image[]) {
		MultipartFile images[] = {null, null, null, null};
		for( int i=0; i<image.length; i++)
			images[i] = image[i];
		vo.setImagepath( image[0]!=null && images[0].getSize()>0 ? common.fileUpload(image[0], ss, "product") : "");
		vo.setImage1( image[1]!=null && images[1].getSize()>0 ? common.fileUpload(image[1], ss, "product") : "");
		vo.setImage2( image[2]!=null && images[2].getSize()>0 ? common.fileUpload(image[2], ss, "product") : "");
		vo.setImage3( image[3]!=null && images[3].getSize()>0 ? common.fileUpload(image[3], ss, "product") : "");
		service.product_insert(vo);
		return "redirect:list.pd";
	}
	
	//상품 상세화면 요청
	@RequestMapping("/detail.pd")
	public String detail(int no, Model model) {
		model.addAttribute("vo", service.product_detail(no));
		return "product/detail";
	}
	
	//상품 삭제처리 요청
	@RequestMapping("/delete.pd")
	public String delete(int no) {
		service.product_delete(no);
		return "redirect:list.pd";
	}
	
	//상품 수정화면 요청
	@RequestMapping("/modify.pd")
	public String modify(int no, Model model) {
		model.addAttribute("vo", service.product_detail(no));
		return "product/modify";
	}
	
	//상품 수정처리 요청
	@RequestMapping("/update.pd")
	public String update() {
//		return "redirect:detail.pd";
		//return -> detail로 가게 변경할 것
		return "redirect:list.pd";
	}
	
	
}
