package contact.controller;

import java.util.List;

import category.bean.CategoryDTO;
import contact.bean.FaqDTO;
import contact.bean.NoticeDTO;

public interface ContactService{
	public List<NoticeDTO> noticeList(int startNum, int endNum);
	
	public int getTotalA();
	
	public int noticeInsertForm(NoticeDTO noticeDTO);
	
	public List<FaqDTO> faqList(int startNum, int endNum);
	
	public int noticeDelete(int notice_num);
	
	public List<CategoryDTO> getCategory();
	
	public int faqInsert(FaqDTO faqDTO);
	
	public int faqDelete(int faq_num);
}
