package cart.bean;

//장바구니 DTO (결제화면 출력 사용 - SELECT JOIN용)
public class CartListDTO {
	private int item_num; 				//아이템 번호
	private int cart_num;  				//장바구니 번호
	private String m_id;					//회원 아이디
	private int item_qty;				//아이템 수량
	private int item_tot; 				//아이템 총액
	private String o_date; 				//주문일
	private String p_store;				//픽업할 매장
	private String p_request_date; //픽업요청날짜
	private String p_request_time; //픽업요청시간
	private String item_name;		//아이템명
	private String item_desc;		//아이템 설명
	private String item_image;	//아이템 이미지
	private int item_price;			//아이템 가격
	private int item_ongoing;		//아이템 판매 여부
	
	//getter & setter
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
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
	public String getItem_name() {
		return item_name;
	}
	public void setItem_name(String item_name) {
		this.item_name = item_name;
	}
	public String getItem_desc() {
		return item_desc;
	}
	public void setItem_desc(String item_desc) {
		this.item_desc = item_desc;
	}
	public String getItem_image() {
		return item_image;
	}
	public void setItem_image(String item_image) {
		this.item_image = item_image;
	}
	public int getItem_price() {
		return item_price;
	}
	public void setItem_price(int item_price) {
		this.item_price = item_price;
	}
	public int getItem_ongoing() {
		return item_ongoing;
	}
	public void setItem_ongoing(int item_ongoing) {
		this.item_ongoing = item_ongoing;
	}	
}
