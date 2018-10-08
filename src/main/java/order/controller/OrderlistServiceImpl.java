package order.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cart.bean.CartInDTO;
import order.bean.OrderlistInDTO;
import order.bean.OrderlistListDTO;
import order.bean.OrderlistSalesDTO;
import order.dao.OrderlistDAO;

@Service
public class OrderlistServiceImpl implements OrderlistService{

	@Autowired
	private OrderlistDAO orderlistDAO;
	
	

	@Override
	public int addOrderlist1(OrderlistInDTO orderlistInDTO) {
		return orderlistDAO.addOrderlist1(orderlistInDTO);
	}

	@Override
	public int addOrderlist2(CartInDTO cartInDTO) {
		return orderlistDAO.addOrderlist2(cartInDTO);
	}

	@Override
	public int updateStatus(int o_status, int o_num) {
		return orderlistDAO.updateStatus(o_status, o_num);
	}

	@Override
	public int orderCancel(int o_num) {
		return orderlistDAO.orderCancel(o_num);
	}

	@Override
	public int pickup(int o_num) {
		return orderlistDAO.pickup(o_num);
	}
	
	
	
	
	
	@Override
	public List<OrderlistListDTO> orderlist_ing(int startNum, int endNum) {
		return orderlistDAO.orderlist_ing(startNum, endNum);
	}
	
	@Override
	public int getOrderlist_ing() {
		return orderlistDAO.getOrderlist_ing();
	}
	
	@Override
	public List<OrderlistListDTO> orderlist_ing_all() {
		return orderlistDAO.orderlist_ing_all();
	}

	



	@Override
	public List<OrderlistListDTO> orderlist_id(String m_id, int startNum, int endNum) {
		return orderlistDAO.orderlist_id(m_id, startNum, endNum);
	}

	@Override
	public int getOrderlist_id(String m_id) {
		return orderlistDAO.getOrderlist_id(m_id);
	}

	@Override
	public int thisMonthCount(String m_id) {
		return orderlistDAO.thisMonthCount(m_id);
	}

	@Override
	public int prevMonthCount(String m_id) {
		return orderlistDAO.prevMonthCount(m_id);
	}

	@Override
	public int prevMonthCount2(String m_id) {
		return orderlistDAO.prevMonthCount2(m_id);
	}	
	
	

	
	
	//동적 SQL
	@Override
	public List<OrderlistListDTO> salesList(Map<String, Object> map) {
		return orderlistDAO.salesList(map);
	}

	@Override
	public int getSalesList(Map<String, Object> map) {
		return orderlistDAO.getSalesList(map);
	}

	@Override
	public int salesTot(Map<String, Object> map) {
		return orderlistDAO.salesTot(map);
	}

	@Override
	public List<OrderlistListDTO> salesList_all(Map<String, Object> map) {
		return orderlistDAO.salesList_all(map);
	}
	
	
	
	
	//일별 매출 목표
	@Override
	public List<OrderlistSalesDTO> dailySales(Map<String, String> map) {
		return orderlistDAO.dailySales(map);
	}

}
