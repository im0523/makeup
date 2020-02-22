package customer;

import java.util.List;

import org.springframework.stereotype.Component;

import common.PageVO;

@Component
public class CustomerPageVO extends PageVO{
	private List<CustomerVO> list;

	public List<CustomerVO> getList() {
		return list;
	}

	public void setList(List<CustomerVO> list) {
		this.list = list;
	}
	
	
}
