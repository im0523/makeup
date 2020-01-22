package store;

public interface StoreService {
	//CRUD
	StorePageVO store_list(StorePageVO page);
	StoreVO store_detail(int id);
	void store_insert(StoreVO vo);
	void store_update(StoreVO vo);
	void store_delete(int id);
	void store_read(int id);
}
