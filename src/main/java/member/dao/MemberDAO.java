package member.dao;



import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.bean.MemberDTO;



@Repository
public class MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	

	public boolean isExisId(String m_id) {
	boolean exist = false;
	if(sqlSession.selectOne("mybatis.memberMapper.idcheck", m_id) != null) {
		exist = true;
	}
	return exist;
	}
	
	public int join(MemberDTO memberDTO) {
		return sqlSession.insert("mybatis.memberMapper.join", memberDTO);
	}
	
	public String login(String m_id, String m_pwd) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_id", m_id);
		map.put("m_pwd", m_pwd);
		return sqlSession.selectOne("mybatis.memberMapper.login", map);
	}
	
	public MemberDTO modifyView(String memId) {
		return sqlSession.selectOne("mybatis.memberMapper.modifyView", memId);
	}
	
	public MemberDTO searchName(String m_name) {
		return sqlSession.selectOne("mybatis.memberMapper.searchName", m_name);
	}

	
	public int modifyUpdate(MemberDTO memberDTO) {
		return sqlSession.update("mybatis.memberMapper.modifyUpdate", memberDTO);
	}
	public int memberDelete(String m_id) {
		return sqlSession.delete("mybatis.memberMapper.memberDelete", m_id);
	}
	// 이메일 중복확인
	public boolean emailCheck(String m_email) {
		boolean result = false;
		if(sqlSession.selectOne("mybatis.memberMapper.emailCheck", m_email) != null) {
			result = true;
		}
		return result;
	}
	// 아이디찾기
	public String idFind(String m_name, String m_email) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_name", m_name);
		map.put("m_email", m_email);
		return sqlSession.selectOne("mybatis.memberMapper.idFind", map);
	}
	// 비밀번호 찾기
	public String pwFind(String m_id, String m_email) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_id", m_id);
		map.put("m_email", m_email);
		return sqlSession.selectOne("mybatis.memberMapper.pwFind", map);
	}
	
	public String pwdCheck(String m_id) {
		return sqlSession.selectOne("mybatis.memberMapper.pwdCheck", m_id);
	}
	
	public MemberDTO kakaoLogin(String m_id) {
		return sqlSession.selectOne("mybatis.memberMapper.kakaoLogin", m_id);
	}

	
	public int changePwd(MemberDTO memberDTO) {
		return sqlSession.update("mybatis.memberMapper.changePwd", memberDTO);
	}
}
