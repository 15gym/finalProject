package item.bean;

public class ReviewDTO {
	String m_id;		//회원아이디
	int item_num;		//아이템 번호
	String subject;		//제목
	String content;		//내용
	int rate;			//평점
	String logtime;		//등록일
	
	
	@Override
	public String toString() {
		return "reviewDTO [m_id=" + m_id + ", item_num=" + item_num + ", subject=" + subject + ", content=" + content
				+ ", rate=" + rate + ", logtime=" + logtime + "]";
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public String getLogtime() {
		return logtime;
	}
	public void setLogtime(String logtime) {
		this.logtime = logtime;
	}
}
