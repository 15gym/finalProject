package cart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cart.bean.CartInDTO;
import cart.bean.CartListDTO;
import cart.dao.CartDAO;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private CartDAO cartDAO;
	
	@Override
	public int addCart(CartInDTO cartDTO) {
		return cartDAO.addCart(cartDTO);
	}

	@Override
	public int updateCart(int item_qty, int cart_num, int item_num) {
		return cartDAO.updateCart(item_qty, cart_num, item_num);
	}

	@Override
	public int deleteCart(int cart_num) {
		return cartDAO.deleteCart(cart_num);
	}


	@Override
	public int totalCart(String m_id) {
		return cartDAO.totalCart(m_id);
	}

	@Override
	public CartListDTO getCart(int cart_num) {
		return cartDAO.getCart(cart_num);
	}
	
	@Override
	public List<CartListDTO> listCart(String m_id) {
		return cartDAO.listCart(m_id);
	}
	
	@Override
	public List<CartInDTO> listCart_order(String m_id) {
		return cartDAO.listCart_order(m_id);
	}

}
