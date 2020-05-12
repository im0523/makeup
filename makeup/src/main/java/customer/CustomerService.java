package customer;

public interface CustomerService {
	//CRUD
	CustomerPageVO customer_list(CustomerPageVO page);	// customer list 출력
	CustomerVO customer_detail(String customer_id);		// customer 상세정보
	void customer_insert(CustomerVO vo);				// customer 등록 처리
	void customer_update(CustomerVO vo);				// customer 정보 수정 처리
	void customer_delete(String customer_id);						// customer 삭제 처리
	
	boolean id_usable(String customer_id);	// 아이디 중복확인(이 아이디를 사용할 수 있다 or 없다 니까 boolean)
	
	CustomerVO login_check(String customer_id, String customer_pw);	// login 처리
	
	CustomerVO findId_email(String customer_name, String customer_email);	// 아이디 찾기(아이디가 있다 or 없다니까 boolean)
	CustomerVO findId_phone(String customer_name, String customer_phone);	// 아이디 찾기(아이디가 있다 or 없다니까 boolean)
}
