package order.bean;

//주문목록 DTO (주문목록에 등록할 때 사용)
public class OrderlistInDTO {
	
	private int o_num;					//주문번호
	private String o_date;				//주문일
	private int cart_num;				//장바구니번호
	private String m_id;					//회원 아이디
	private String p_request_date;	//픽업요청일
	private String p_request_time;	//픽업요청 시간
	private String p_store;				//픽업할 매장
	private int item_num;				//아이템 번호
	private int item_qty;				//아이템 구매 수량
	private int item_tot;				//아이템 구매 총액
	private String payment;			//결제 방법 (카드/무통장입금)
	private String p_actual_time;	//실제 픽업 시간
	private int o_status;				//주문 준비 현황
		/*
		 준비현황 숫자 분류
		  - 입금여부 ("입금대기 1"/"입금완료 2")  ***(입금완료 상태까지만 주문취소 가능)
		  - 주문물품준비여부 ("준비중 3"/"준비완료 4")
		  - 픽업여부 ("픽업대기 5 "/"픽업완료 6")
		  - 주문취소여부 ("주문취소 0")
		*/ 
	
	
	//getter & setter
	public int getO_num() {
		return o_num;
	}
	public void setO_num(int o_num) {
		this.o_num = o_num;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
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
	public String getP_store() {
		return p_store;
	}
	public void setP_store(String p_store) {
		this.p_store = p_store;
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
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public String getP_actual_time() {
		return p_actual_time;
	}
	public void setP_actual_time(String p_actual_time) {
		this.p_actual_time = p_actual_time;
	}
	public int getO_status() {
		return o_status;
	}
	public void setO_status(int o_status) {
		this.o_status = o_status;
	}
}
