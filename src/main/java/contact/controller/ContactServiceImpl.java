package contact.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import category.bean.CategoryDTO;
import contact.bean.FaqDTO;
import contact.bean.NoticeDTO;
import contact.dao.ContactDAO;
@Service
public class ContactServiceImpl implements ContactService{
	
	@Autowired
	ContactDAO contactDAO;
	
	@Override
	public List<NoticeDTO> noticeList(int startNum, int endNum) {
		return contactDAO.noticeList(startNum, endNum);
	}

	@Override
	public int getTotalA() {
		return contactDAO.getTotalA();
	}


	@Override
	public int noticeInsertForm(NoticeDTO noticeDTO) {
		return contactDAO.noticeInsert(noticeDTO);
	}

	@Override
	public List<FaqDTO> faqList(int startNum, int endNum) {
		return contactDAO.faqList(startNum, endNum);
	}

	@Override
	public int noticeDelete(int notice_num) {
		return contactDAO.noticeDelete(notice_num);
	}

	@Override
	public List<CategoryDTO> getCategory() {
		return contactDAO.getCategory();
	}

	@Override
	public int faqInsert(FaqDTO faqDTO) {
		return contactDAO.faqInsert(faqDTO);
	}

	@Override
	public int faqDelete(int faq_num) {
		return contactDAO.faqDelete(faq_num);
	}
}
