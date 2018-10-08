package item.bean;

public class ItemDTO {
	int i_category;
	int item_num;
	String item_name;
	String item_desc;
	String item_image;
	int item_price;
	int item_ongoing; // 0 : 판매중 , 1: 품절, 2: 생산중단
	
	
	public int getI_category() {
		return i_category;
	}
	public void setI_category(int i_category) {
		this.i_category = i_category;
	}
	public int getItem_num() {
		return item_num;
	}
	public void setItem_num(int item_num) {
		this.item_num = item_num;
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
