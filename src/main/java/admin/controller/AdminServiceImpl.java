package admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import admin.bean.AdminDTO;
import admin.dao.AdminDAO;
import member.bean.MemberDTO;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public AdminDTO adminGetAll(String a_id) {
		return adminDAO.adminGetAll(a_id);
	}

	@Override
	public String adminLogin(String a_id, String a_pwd) {
		return adminDAO.adminLogin(a_id, a_pwd);
	}

	@Override
	public boolean adminIdCheck(String a_id) {
		return adminDAO.adminIdCheck(a_id);
	}

	@Override
	public int adminJoin(AdminDTO adminDTO) {
		return adminDAO.adminJoin(adminDTO);
	}
	
	@Override
	public List<AdminDTO> adminList() {
		return adminDAO.adminList();
	}
	
	@Override
	public List<MemberDTO> memberList(int startNum, int endNum) {
		return adminDAO.memberList(startNum, endNum);
	}

	@Override
	public int getTotalA() {
		return adminDAO.getTotalA();
	}

	@Override
	public List<MemberDTO> searchName(String m_name) {
		return adminDAO.searchName(m_name);
	}

	@Override
	public List<MemberDTO> searchId(String m_id) {
		return adminDAO.searchId(m_id);
	}

}
