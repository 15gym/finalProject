package member.controller;

import java.util.List;

import member.bean.MemberDTO;

public interface MemberService {
	
	//아이디 중복확인
	public boolean isExisId(String id);
	//회원가입
	public int join(MemberDTO memberDTO);
	// 로그인
	public String login(String m_id, String m_pwd);
	
	// 내정보보기 
	public MemberDTO modifyView(String memId);
	
	
	// 내정보 수정하기
	public int modifyUpdate(MemberDTO memberDTO);
	// 회원탈퇴
	public int memberDelete(String m_id);
	// 이메일 중복확인
	public boolean emailCheck(String m_email);
	// 아이디찾기
	public String idFind(String m_name, String m_email);
	// 비밀번호 찾기
	public String pwFind(String m_id, String m_email);
	
	public String pwdCheck(String m_id);
	
	public MemberDTO kakaoLogin(String m_id);
}
