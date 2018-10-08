package order.bean;

//주문목록 DTO (주문목록에서 조회할 할 때 사용 - SELECT JOIN용)
public class OrderlistListDTO {
	private String m_id;					//회원 아이디
	private int item_num;				//아이템 번호
	private int o_num;					//주문 번호
	private String o_date;				//주문일
	private int cart_num;				//장바구니번호
	private String p_request_date;	//픽업요청일
	private String p_request_time;	//픽업요청 시간
	private String p_store;				//픽업할 매장
	private int item_qty;				//아이템 구매 수량
	private int item_tot;				//아이템 구매 총액
	private String payment;			//결제 방법 (카드/무통장입금)
	private String p_actual_time;	//실제 픽업 시간
	private int o_status;				//주문 준비 현황
	private int i_category;				//카테고리 번호
	private String item_name;			//아이템 이름
	private String item_desc;			//아이템 설명
	private String itme_image;		//아이템 이미지
	private int item_price;				//아이템 가격
	private int item_ongoing;			//아이템 판매 여부 (기본값0: 판매 중 / 1: 품절 (목록에는 출력) / 2:생산중단 (목록 출력 X))
	private int m_num;					//회원 번호
	private String m_name;			//회원 이름
	private String m_pwd;				//회원 비밀번호
	private String m_phone;			//회원 전화번호
	private String m_email;				//회원 이메일
	private String m_logtime;			//회원 가입일
	private String o_comment;		//주문 준비 현황 (한글)
	
	
	//getter & setter
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
	public int getI_category() {
		return i_category;
	}
	public void setI_category(int i_category) {
		this.i_category = i_category;
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
	public String getItme_image() {
		return itme_image;
	}
	public void setItme_image(String itme_image) {
		this.itme_image = itme_image;
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
	public int getM_num() {
		return m_num;
	}
	public void setM_num(int m_num) {
		this.m_num = m_num;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_pwd() {
		return m_pwd;
	}
	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_logtime() {
		return m_logtime;
	}
	public void setM_logtime(String m_logtime) {
		this.m_logtime = m_logtime;
	}
	public String getO_comment() {
		return o_comment;
	}
	public void setO_comment(String o_comment) {
		this.o_comment = o_comment;
	}
}
