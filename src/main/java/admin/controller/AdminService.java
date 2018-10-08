package admin.controller;

import java.util.List;

import admin.bean.AdminDTO;
import member.bean.MemberDTO;

public interface AdminService {
	// 관리자정보추출
	public AdminDTO adminGetAll(String a_id);
	// 관리자 로그인
	public String adminLogin(String a_id, String a_pwd);
	// 관리자 아이디 중복체크
	public boolean adminIdCheck(String a_id);
	
	public int adminJoin(AdminDTO adminDTO);
	
	//관리자 목록
	public List<AdminDTO> adminList();
	
	public List<MemberDTO> memberList(int startNum, int endNum);
	
	public List<MemberDTO> searchName(String m_name,int startNum, int endNum);
	
	public List<MemberDTO> searchId(String m_id,int startNum, int endNum);
	
	public int getTotalA();
}
