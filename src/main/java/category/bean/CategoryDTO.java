package category.bean;

public class CategoryDTO {
	private int i_category;
	private String category_name;
	private String category_image;
	private int category_ongoing;
	@Override
	public String toString() {
		return "CategoryDTO [i_category=" + i_category + ", category_name=" + category_name + ", category_image="
				+ category_image + ", category_ongoing=" + category_ongoing + "]";
	}
	public int getI_category() {
		return i_category;
	}
	public void setI_category(int i_category) {
		this.i_category = i_category;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getCategory_image() {
		return category_image;
	}
	public void setCategory_image(String category_image) {
		this.category_image = category_image;
	}
	public int getCategory_ongoing() {
		return category_ongoing;
	}
	public void setCategory_ongoing(int category_ongoing) {
		this.category_ongoing = category_ongoing;
	}
}
