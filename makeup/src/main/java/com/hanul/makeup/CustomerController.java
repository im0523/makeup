package com.hanul.makeup;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
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
	public String list(Model model, @RequestParam(defaultValue = "1") int curPage,
									@RequestParam(defaultValue = "") String search,
									@RequestParam(defaultValue = "") String keyword ) {
		
		page.setCurPage(curPage);	// curpage 기본 값을 1로 set 해준다
		page.setKeyword(keyword);
		page.setSearch(search);
		
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
	
	// customer 삭제 처리 요청
	@RequestMapping("/delete.cu")
	public String delete(String customer_id) {
		service.customer_delete(customer_id);
		return "redirect:list.cu";
	}
	
	// login 화면 요청
	@RequestMapping("/login")
	public String login() {
		return "customer/login";
	}
	
	// login 처리 요청
	@ResponseBody @RequestMapping("/loginCheck")
	public int login_check(String customer_id, String customer_pw, HttpSession ss) {
		CustomerVO vo = service.login_check(customer_id, customer_pw);
		ss.setAttribute("login_info", vo);
		
		int result = 0;
		
		result = ( vo == null ? 0 : 1 );
		return result;
	}
	
	// logout 처리
	@ResponseBody @RequestMapping("/logout")
	public void logout(HttpSession ss) {
		ss.removeAttribute("login_info");
	}
	
	// id 찾기
	@RequestMapping("/findId")
	public String findId(String customer_name, String customer_email, String customer_phone) {
//		if( customer_phone == null ) {
//			CustomerVO vo = service.findId_email(customer_name, customer_email);
//		}else if( customer_email == null ) {
//			CustomerVO vo = service.findId_phone(customer_name, customer_email);
//		}
		
		return "customer/findId";
	}
}
