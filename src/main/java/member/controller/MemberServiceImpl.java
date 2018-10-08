package member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import member.bean.MemberDTO;
import member.dao.MemberDAO;



@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;


	@Override
	public boolean isExisId(String m_id) {
		return memberDAO.isExisId(m_id);
	}

	@Override
	public int join(MemberDTO memberDTO) {
		return memberDAO.join(memberDTO);
	}

	@Override
	public String login(String m_id, String m_pwd) {
		return memberDAO.login(m_id, m_pwd);
	}
	public MemberDTO modifyView(String memId) {
		return memberDAO.modifyView(memId);
	}

	@Override
	public int modifyUpdate(MemberDTO memberDTO) {
		return memberDAO.modifyUpdate(memberDTO);
	}

	@Override
	public int memberDelete(String m_id) {
		return memberDAO.memberDelete(m_id);
	}

	@Override
	public boolean emailCheck(String m_email) {
		return memberDAO.emailCheck(m_email);
	}

	@Override
	public String idFind(String m_name, String m_email) {
		return memberDAO.idFind(m_name, m_email);
	}

	@Override
	public String pwFind(String m_id, String m_email) {
		return memberDAO.pwFind(m_id, m_email);
	}

	@Override
	public String pwdCheck(String m_id) {
		return memberDAO.pwdCheck(m_id);
	}

	@Override
	public MemberDTO kakaoLogin(String m_id) {
		return memberDAO.kakaoLogin(m_id);
	}


}

