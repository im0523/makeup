package com.hanul.makeup;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import common.CommonService;
import image.ImageVO;
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
		model.addAttribute("codeList", common.codeNameList("category"));
		return "product/new";
	}
	
	//상품 등록처리 요청
	@RequestMapping("/insert.pd")
	public String insert(ProductVO productVo, ImageVO imageVo, HttpSession ss,
						 MultipartFile thumbNail, MultipartFile image[], Model model) {
		model.addAttribute("codeList", common.codeNameList("category"));
		
		productVo.setProduct_thumbNail( common.fileUpload(thumbNail, ss, "product") );	//물리적 위치에 파일 저장
		
		int result = service.product_insert(productVo);		// 상품 등록처리

		if( result == 1 ) {
			for( int i=0; i<image.length; i++ ) {
				if(image[i] != null && image[i].getSize() > 0 ) {
					imageVo.setImagepath( common.fileUpload(image[i], ss, "product") );
					service.image_insert(imageVo);
				}
			}
		}
		return "redirect:list.pd";
	}
	
	//상품 상세화면 요청
	@RequestMapping("/detail.pd")
	public String detail(int product_no, Model model) {
		model.addAttribute("vo", service.product_detail(product_no));
		model.addAttribute("imageList", service.image_detail(product_no));
		return "product/detail";
	}
	
	//상품 삭제처리 요청
	@RequestMapping("/delete.pd")
	public String delete(int product_no) {
		service.product_delete(product_no);
		return "redirect:list.pd";
	}
	
	//상품 수정화면 요청
	@RequestMapping("/modify.pd")
	public String modify(int product_no, Model model) {
		model.addAttribute("codeList", common.codeNameList("category"));
		model.addAttribute("vo", service.product_detail(product_no));
		model.addAttribute("imageList", service.image_detail(product_no));

		return "product/modify";
	}
	
	//상품 수정처리 요청
	@RequestMapping("/update.pd")
	public String update(ProductVO productVo, ImageVO imageVo, MultipartFile thumbNail, MultipartFile image[],
						 HttpSession ss, Model model, int delete) {
		ProductVO old = service.product_detail( productVo.getProduct_no() );
		List<ImageVO> oldImg = service.image_detail(productVo.getProduct_no());
		
		String uuid = ss.getServletContext().getRealPath("resources") + old.getProduct_thumbNail();
		
		// thumbNail 변경 없이 기존 이미지 사용할 경우
		if( delete == 0 ) {
			productVo.setProduct_thumbNail( old.getProduct_thumbNail() );
		}else {
			// thumbNail을 변경해서 수정 저장 할 경우
			File f = new File( uuid );							// 원래 첨부된 파일 - 물리적 위치에서 삭제
			if ( f.exists() ) f.delete();
			
			productVo.setProduct_thumbNail( common.fileUpload(thumbNail, ss, "product") );	// 물리적 위치에 파일 저장
		}
//		System.out.println("thumbNail : " + productVo.getProduct_thumbNail());
//		System.out.println("uuid : " + uuid);
		
		int result = service.product_update(productVo);
		
		if( result == 1 ) {
			service.image_delete(productVo.getProduct_no());	// 먼저 image Table data들 일괄 삭제
			int imgSize = oldImg.size();
			
			for( int i=0; i<image.length; i++ ) {
//				System.out.println( "size : "+imgSize );
//				System.out.println( "i : "+i );
				if( imgSize > i ) {
//					System.out.println("기존파일"+i+" : " + oldImg.get(i).getImagepath());
					imageVo.setImagepath(oldImg.get(i).getImagepath());
					if (image[i].getSize() == 0) {
						service.image_insert(imageVo);
					}
				}
				
				// 파일을 첨부하는 경우
				if( image[i] != null && image[i].getSize() > 0 ) {
					imageVo.setImagepath( common.fileUpload(image[i], ss, "product") );	// 물리적 위치에 파일 저장
//					System.out.println("변경한파일"+i+" : " + imageVo.getImagepath());
					service.image_insert(imageVo);
					
					String imgUuid = ss.getServletContext().getRealPath("resources") + oldImg.get(i).getImagepath();
					
					File f = new File( imgUuid );							// 원래 첨부된 파일 - 물리적 위치에서 삭제
					if ( f.exists() ) f.delete();
//				}else {
//					 // 파일을 첨부하지 않을 경우 - 1. 기존 파일 사용
//					oldImg.set(i, element)
//					
//					service.image_insert(imageVo);
//					
//					imageVo.setProduct_no( old.getProduct_no() );
				}
			}
		}
		
		return "redirect:list.pd";
	}
	
	//상품 구매화면 요청
	@RequestMapping("/buy.pd")
	public String buy(Model model, int product_no) {
		model.addAttribute("vo", service.product_detail(product_no));
		return "product/buy";
	}
	
}
