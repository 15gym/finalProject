package member.bean;

//회원정보 DTO
public class MemberDTO {
	private int m_num;
	private String m_name;
	private String m_id;
	private String m_pwd;
	private String m_phone;
	private String m_email;
	private String m_logtime;
	

	//getter & setter
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
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
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
}
