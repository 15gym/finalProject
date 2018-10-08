package qna.bean;

public class QnaDTO {
	
	private int qna_num;			//글 번호
	private String qna_type;		//문의 종류 (상품,주문,환불,기타)
	private String qna_result;		//답변 여부 (y/n)
	private String qna_subject;	//제목
	private String qna_content;	//문의내용
	private String m_id;				//회원 아이디
	private String qna_logtime;	//문의글 등록일
	private String qna_reply;		//답변내용
	private String qna_redate;	//답변 등록일
	private String qna_public;		//공개 비공개 여부
	private int hit;					//조회수
	
	//getter & setter
	public int getQna_num() {
		return qna_num;
	}
	public void setQna_num(int qna_num) {
		this.qna_num = qna_num;
	}
	public String getQna_type() {
		return qna_type;
	}
	public void setQna_type(String qna_type) {
		this.qna_type = qna_type;
	}
	public String getQna_result() {
		return qna_result;
	}
	public void setQna_result(String qna_result) {
		this.qna_result = qna_result;
	}
	public String getQna_subject() {
		return qna_subject;
	}
	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getQna_logtime() {
		return qna_logtime;
	}
	public void setQna_logtime(String qna_logtime) {
		this.qna_logtime = qna_logtime;
	}
	public String getQna_reply() {
		return qna_reply;
	}
	public void setQna_reply(String qna_reply) {
		this.qna_reply = qna_reply;
	}
	public String getQna_redate() {
		return qna_redate;
	}
	public void setQna_redate(String qna_redate) {
		this.qna_redate = qna_redate;
	}
	public String getQna_public() {
		return qna_public;
	}
	public void setQna_public(String qna_public) {
		this.qna_public = qna_public;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}

}
