package cart.controller;

import java.util.List;

import cart.bean.CartInDTO;
import cart.bean.CartListDTO;

public interface CartService {
	
	//장바구니 추가
	int addCart(CartInDTO cartDTO);
	
	//장바구니 수정
	int updateCart(int item_qty, int cart_num, int item_num);
	
	//장바구니 삭제
	int deleteCart(int cart_num);
	
	//장바구니 1개 가져오기 (출력용)
	CartListDTO getCart(int cart_num);
	
	//장바구니 목록 (출력용)
	List<CartListDTO> listCart(String m_id);
	
	//장바구니 목록 (결제용)
	List<CartInDTO> listCart_order(String m_id);
	
	//장바구니 개수 (아이디 별 개수)
	int totalCart(String m_id);
	
}
