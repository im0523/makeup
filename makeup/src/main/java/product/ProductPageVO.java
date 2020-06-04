package product;


import java.util.List;

import org.springframework.stereotype.Component;

import common.PageVO;

@Component
public class ProductPageVO extends PageVO{
	private List<ProductVO> list;
	
	private String cate_val;

	public List<ProductVO> getList() {
		return list;
	}

	public void setList(List<ProductVO> list) {
		this.list = list;
	}

	public String getCate_val() {
		return cate_val;
	}

	public void setCate_val(String cate_val) {
		this.cate_val = cate_val;
	}
	
	
}
