package order.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cart.bean.CartInDTO;
import category.bean.CategoryDTO;
import item.bean.ItemDTO;
import order.bean.OrderlistInDTO;
import order.bean.OrderlistListDTO;
import order.bean.OrderlistSalesDTO;

@Repository
public class OrderlistDAO {

	@Autowired
	private SqlSessionTemplate sqlsession;
	
	//오더리스트 추가 1
	public int addOrderlist1(OrderlistInDTO orderlistInDTO) {
		
		return sqlsession.insert("mybatis.orderlistMapper.addOrderlist1", orderlistInDTO);
	}
	
	//오더리스트 추가 2
	public int addOrderlist2(CartInDTO cartInDTO) {
		return sqlsession.update("mybatis.orderlistMapper.addOrderlist2", cartInDTO);
	}
	
	
	
	//준비현황 업데이트
	public int updateStatus(int o_status, int o_num) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("o_status", o_status);
		map.put("o_num", o_num);
		return sqlsession.update("mybatis.orderlistMapper.updateStatus", map);
	}
	
	//주문 취소 시 아이템 수량 & 총액을 0으로 변경 - 주문현황코드를 0으로 변경한 후 실행할 것
	public int orderCancel(int o_num) {
		return sqlsession.update("mybatis.orderlistMapper.orderCancel", o_num);
	}
	
	//주문 완료 시 실제 픽업시간 업데이트
	public int pickup(int o_num) {
		return sqlsession.update("mybatis.orderlistMapper.pickup", o_num);
	}
	
	

	
	
	//오더리스트 중 완료되지 않은 주문 목록 가져오기
	public List<OrderlistListDTO> orderlist_ing(int startNum, int endNum){
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlsession.selectList("mybatis.orderlistMapper.orderlist_ing", map);
	}
	
	//오더리스트 중 완료되지 않은 주문 목록 개수 가져오기
	public int getOrderlist_ing() {
		return sqlsession.selectOne("mybatis.orderlistMapper.getOrderlist_ing");
	}
	
	//오더리스트 중 완료되지 않은 주문 목록 가져오기 (전체 목록. 페이징 x)
	public List<OrderlistListDTO> orderlist_ing_all(){
		return sqlsession.selectList("mybatis.orderlistMapper.orderlist_ing_all");
	}
	

	
	
	//오더리스트 목록 가져오기 - 특정 아이디 기준
	public List<OrderlistListDTO> orderlist_id(String m_id, int startNum, int endNum){
		Map<String, String> map = new HashMap<String, String>();
		String startNum2 = Integer.toString(startNum);
		String endNum2 = Integer.toString(endNum);
		map.put("m_id", m_id);
		map.put("startNum", startNum2);
		map.put("endNum", endNum2);
		return sqlsession.selectList("mybatis.orderlistMapper.orderlist_id", map);
	}
	
	//아이디별 구매 건 수 가져오기
	public int getOrderlist_id(String m_id) {
		return sqlsession.selectOne("mybatis.orderlistMapper.getOrderlist_id", m_id);
	}
	
	//이번달 구매 횟수
	public int thisMonthCount (String m_id) {
		return sqlsession.selectOne("mybatis.orderlistMapper.thisMonthCount", m_id);
	}
	
	//지난달 구매 횟수
	public int prevMonthCount (String m_id) {
		return sqlsession.selectOne("mybatis.orderlistMapper.prevMonthCount", m_id);
	}
	
	//지지난달 구매 횟수
	public int prevMonthCount2 (String m_id) {
		return sqlsession.selectOne("mybatis.orderlistMapper.prevMonthCount2", m_id);
	}
	
	
	
	
	
	//오더리스트 중 완료된 주문 목록 가져오기 (동적 SQL)
	public List<OrderlistListDTO> salesList(Map<String, Object> map){
		return sqlsession.selectList("mybatis.orderlistMapper.salesList", map);
	}
	
	//오더리스트 중 완료된 주문 목록 개수 가져오기 (동적 SQL)
	public int getSalesList (Map<String, Object> map){
		return sqlsession.selectOne("mybatis.orderlistMapper.getSalesList", map);
	}
	
	//오더리스트 중 완료된 주문 목록의 총액 가져오기 (동적 SQL)
	public int salesTot (Map<String, Object> map){
		return sqlsession.selectOne("mybatis.orderlistMapper.salesTot", map);
	}
	
	//오더리스트 중 완료된 주문 목록 가져오기(전체 목록) (동적 SQL)
	public List<OrderlistListDTO> salesList_all(Map<String, Object> map){
		return sqlsession.selectList("mybatis.orderlistMapper.salesList_all", map);
	}
	
	
	
	//일별 매출 목록
	public List<OrderlistSalesDTO> dailySales(Map<String, String> map){
		return sqlsession.selectList("mybatis.orderlistMapper.dailySales", map);
	};
}
