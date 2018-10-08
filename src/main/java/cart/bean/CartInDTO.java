package cart.bean;

//장바구니 DTO (장바구니에 담을 때 사용)
public class CartInDTO {
	private int cart_num;  				//장바구니 번호
	private String m_id;					//회원 아이디
	private int item_num; 				//아이템 번호
	private int item_qty;				//아이템 수량
	private int item_tot; 				//아이템 총액
	private String o_date; 				//주문일
	private String p_store;				//픽업할 매장
	private String p_request_date; //픽업요청날짜
	private String p_request_time; //픽업요청시간
	
	//getter & setter
	public int getCart_num() {
		return cart_num;
	}
	public void setCart_num(int cart_num) {
		this.cart_num = cart_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}
	public int getItem_qty() {
		return item_qty;
	}
	public void setItem_qty(int item_qty) {
		this.item_qty = item_qty;
	}
	public int getItem_tot() {
		return item_tot;
	}
	public void setItem_tot(int item_tot) {
		this.item_tot = item_tot;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	public String getP_store() {
		return p_store;
	}
	public void setP_store(String p_store) {
		this.p_store = p_store;
	}
	public String getP_request_date() {
		return p_request_date;
	}
	public void setP_request_date(String p_request_date) {
		this.p_request_date = p_request_date;
	}
	public String getP_request_time() {
		return p_request_time;
	}
	public void setP_request_time(String p_request_time) {
		this.p_request_time = p_request_time;
	}	
}
