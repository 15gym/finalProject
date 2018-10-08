package order.bean;

//일별 매출 DTO
public class OrderlistSalesDTO {
	
	private int dailySales;				//일별 누적 금액
	private String o_date;				//주문일
	
	
	//getter & setter
	public int getDailySales() {
		return dailySales;
	}
	public void setDailySales(int dailySales) {
		this.dailySales = dailySales;
	}
	public String getO_date() {
		return o_date;
	}
	public void setO_date(String o_date) {
		this.o_date = o_date;
	}
	
}
