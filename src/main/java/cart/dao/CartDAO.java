package cart.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cart.bean.CartInDTO;
import cart.bean.CartListDTO;

@Repository
public class CartDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//장바구니 추가
	public int addCart(CartInDTO cartInDTO) {
		return sqlSession.insert("mybatis.cartMapper.addCart", cartInDTO);
	}
	
	//장바구니 수정
	public int updateCart(int item_qty, int cart_num, int item_num) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("item_qty", item_qty);
		map.put("cart_num", cart_num);
		map.put("item_num", item_num);
		return sqlSession.update("mybatis.cartMapper.updateCart", map);
	}
	
	//장바구니 삭제
	public int deleteCart(int cart_num) {
		return sqlSession.delete("mybatis.cartMapper.deleteCart", cart_num);
	}
	
	//장바구니 1개 가져오기(출력용)
	public CartListDTO getCart(int cart_num) {
		return sqlSession.selectOne("mybatis.cartMapper.getCart", cart_num);
	}
	
	//장바구니 목록 (출력용)
	public List<CartListDTO> listCart(String m_id){
		return sqlSession.selectList("mybatis.cartMapper.listCart", m_id);
	}
	
	//장바구니 목록 (결제용)
	public List<CartInDTO> listCart_order(String m_id){
		return sqlSession.selectList("mybatis.cartMapper.listCart_order", m_id);
	}
	
	//장바구니 개수 (아이디별)
	public int totalCart(String m_id) {
		return sqlSession.selectOne("mybatis.cartMapper.totalCart", m_id);
	}
}
