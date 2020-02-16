package com.hanul.makeup;

import java.io.File;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
		model.addAttribute("crlf", "\r\n");
		return "store/detail";
	}
	
	//첨부파일 다운로드 요청
	@ResponseBody @RequestMapping("/download.st")
	public File download(int id, HttpSession ss, HttpServletResponse response) {
		StoreVO vo = service.store_detail(id);
		return common.fileDownload(vo.getFilename(), vo.getFilepath(), ss, response);
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
	
	//게시글 삭제처리
	@RequestMapping("/delete.st")
	public String delete(int id) {
		service.store_delete(id);
		return "redirect:list.st";
	}
	
	//게시글 수정화면 요청
	@RequestMapping("/modify.st")
	public String modify(int id, Model model) {
		model.addAttribute("vo", service.store_detail(id));
		return "store/modify";
	}
	
	//게시글 수정처리 요청
	@RequestMapping("/update.st")
	public String update(StoreVO vo, int id, MultipartFile file, HttpSession ss, int delete) {
		StoreVO old = service.store_detail(id);
		String uuid = ss.getServletContext().getRealPath("resources");
		if( file.getSize()>0 ) {
			//파일을 첨부하는 경우
			vo.setFilename( file.getOriginalFilename() );
			vo.setFilepath( common.fileUpload(file, ss, "store"));
			
			//원래 첨부된 파일을 바꿔 첨부하는 경우
			//원래 첨부된 파일을 삭제한다.
			File f = new File( uuid );
			if ( f.exists() ) { f.delete(); }
		}else {
			//파일을 첨부하지 않는 경우
			if( delete != 1) {
				//1. 원래 첨부된 파일을 그대로 사용하는 경우
				vo.setFilename( old.getFilename() );
				vo.setFilepath( old.getFilepath() );
			} else {
				//2. 원래 첨부된 파일을 삭제하는 경우
				//원래 첨부된 파일을 삭제한다.
				File f = new File( uuid );
				if ( f.exists() ) { f.delete(); }
			}
		}
		return "store/redirect";
	}
	
}
