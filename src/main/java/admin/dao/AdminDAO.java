package admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import admin.bean.AdminDTO;
import member.bean.MemberDTO;


@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	
	public AdminDTO adminGetAll(String a_id) {
		return sessionTemplate.selectOne("mybatis.cateMapper.getAll", a_id);
	}
	public String adminLogin(String a_id, String a_pwd) {
		Map<String, String> map = new HashMap<>();
		map.put("a_id", a_id);
		map.put("a_pwd", a_pwd);
		return sessionTemplate.selectOne("mybatis.cateMapper.adminLogin", map);
	}
	public boolean adminIdCheck(String a_id) {
		boolean exist = false;
		if(sessionTemplate.selectOne("mybatis.cateMapper.adminIdCheck", a_id) != null){
			exist = true;
		}
		return exist; 
	}
	public int adminJoin(AdminDTO adminDTO) {
		return sessionTemplate.insert("mybatis.cateMapper.adminJoin",adminDTO );
	}
	
	//관리자 목록
	public List<AdminDTO> adminList(){
		return sessionTemplate.selectList("mybatis.cateMapper.adminList");
	}
	
	
	//회원 목록
	public List<MemberDTO> memberList(int startNum, int endNum){
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		
		return sessionTemplate.selectList("mybatis.cateMapper.memberList", map);
	}
	
	//회원 수
	public int getTotalA() {
		return sessionTemplate.selectOne("mybatis.cateMapper.getTotalA");
	}
	
	//회원 이름 검색 결과
	public List<MemberDTO> searchName(String m_name){
		/*
		Map<String, Object> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("m_name", m_name);*/
		return sessionTemplate.selectList("mybatis.cateMapper.searchName", m_name);
	}
	
	//회원 아이디 검색 결과
	public List<MemberDTO> searchId(String m_id){
		Map<String, Object> map = new HashMap<>();
		/*
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("m_id", m_id); */
		return sessionTemplate.selectList("mybatis.cateMapper.searchId", m_id);
	}
	
}
