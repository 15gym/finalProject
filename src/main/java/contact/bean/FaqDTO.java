package contact.bean;

public class FaqDTO {
	private int faq_num;
	private String category_name;
	private String faq_subject;
	private String faq_content;
	private String faq_logtime;
	
	public int getFaq_num() {
		return faq_num;
	}
	public void setFaq_num(int faq_num) {
		this.faq_num = faq_num;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getFaq_subject() {
		return faq_subject;
	}
	public void setFaq_subject(String faq_subject) {
		this.faq_subject = faq_subject;
	}
	public String getFaq_content() {
		return faq_content;
	}
	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}
	public String getFaq_logtime() {
		return faq_logtime;
	}
	public void setFaq_logtime(String faq_logtime) {
		this.faq_logtime = faq_logtime;
	}
	
	
}
