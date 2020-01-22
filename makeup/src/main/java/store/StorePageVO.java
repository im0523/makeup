package store;

import java.util.List;

import org.springframework.stereotype.Component;

import common.PageVO;

@Component
public class StorePageVO extends PageVO{
	private List<StoreVO> list;

	public List<StoreVO> getList() {
		return list;
	}

	public void setList(List<StoreVO> list) {
		this.list = list;
	}
	
	
}
