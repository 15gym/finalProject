package order.controller;

import java.util.List;
import java.util.Map;

import cart.bean.CartInDTO;
import order.bean.OrderlistInDTO;
import order.bean.OrderlistListDTO;
import order.bean.OrderlistSalesDTO;

public interface OrderlistService {
	
	int addOrderlist1(OrderlistInDTO orderlistInDTO);
	
	int addOrderlist2(CartInDTO cartInDTO);
	
	int updateStatus(int o_status, int o_num);
	
	int orderCancel(int o_num);
	
	int pickup (int o_num);
	
	

	
	
	List<OrderlistListDTO> orderlist_ing(int startNum, int endNum);
	
	int getOrderlist_ing();
	
	List<OrderlistListDTO> orderlist_ing_all();
	
	
	
	List<OrderlistListDTO> orderlist_id(String m_id, int startNum, int endNum);
	
	int getOrderlist_id(String m_id);

	int thisMonthCount (String m_id);
	
	int prevMonthCount (String m_id);
	
	int prevMonthCount2 (String m_id);


	
		
	
	//동적 SQL
	List<OrderlistListDTO> salesList(Map<String, Object> map);
	int getSalesList(Map<String, Object> map);
	int salesTot(Map<String, Object> map);
	List<OrderlistListDTO> salesList_all(Map<String, Object> map);
	
	
	
	//일별 매출
	List<OrderlistSalesDTO> dailySales(Map<String, String> map);
	
}
