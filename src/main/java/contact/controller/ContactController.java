package contact.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import category.bean.CategoryDTO;
import contact.bean.FaqDTO;
import contact.bean.NoticeDTO;

@Controller
public class ContactController {
	
	@Autowired
	ContactService contactService;
	
	
	
	@RequestMapping(value="/main/boardMain")
	public ModelAndView boardMain(HttpServletRequest request, ModelAndView modelAndView) {
	
		System.out.println("[게시판 모음 페이지로 이동]");
		modelAndView.addObject("display2", "../qna/boardMain.jsp");
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
	}
	
	
	@RequestMapping(value="/main/noticeBoardList")
	public ModelAndView noticeList(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[공지사항 목록으로 이동]");
		int pg =1;
		int endNum = pg*10;
		int startNum = endNum-9;
		
		ArrayList<NoticeDTO> list = (ArrayList<NoticeDTO>)contactService.noticeList(startNum, endNum);
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("display2", "../qna/boardMain.jsp");
		modelAndView.addObject("boardDisplay", "../news/noticeBoardList.jsp");
		modelAndView.setViewName("../main/main.jsp");
		
		return modelAndView;
	}
	
	
	/*
	@RequestMapping(value="/main/noticeBoardList")
	public ModelAndView noticeList(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		int pg =1;
		int endNum = pg*10;
		int startNum = endNum-9;
		
		ArrayList<NoticeDTO> list = (ArrayList<NoticeDTO>)contactService.noticeList(startNum, endNum);
		
		modelAndView.addObject("list", list);
		modelAndView.setViewName("../news/noticeBoardList.jsp");
		
		return modelAndView;
	}*/
	
	
	@RequestMapping(value="/admin/noticeInsert")
	public ModelAndView noticeInsert(HttpServletRequest request) {
		String notice_subject = request.getParameter("notice_subject");
		String notice_content = request.getParameter("notice_content");
		
		NoticeDTO noticeDTO = new NoticeDTO();
		noticeDTO.setNotice_subject(notice_subject);
		noticeDTO.setNotice_content(notice_content);
		
		int result = contactService.noticeInsertForm(noticeDTO);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("../news/noticeInsert.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/noticeInsertForm")
	public ModelAndView noticeInsertForm(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("tab", "admin_board.jsp");
		modelAndView.addObject("display", "../news/noticeInsertForm.jsp");
		modelAndView.setViewName("../admin/admin_main.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/main/faqBoardList")
	public ModelAndView faqList(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		int pg = 1;
		int endNum = pg*10;
		int startNum = endNum-9;
		
		ArrayList<FaqDTO> list = (ArrayList<FaqDTO>)contactService.faqList(startNum, endNum);
		System.out.println(list);
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("display2", "../qna/boardMain.jsp");
		modelAndView.addObject("boardDisplay", "../faq/faqBoardList.jsp");
		modelAndView.setViewName("../main/main.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/noticeDeleteForm")
	public ModelAndView noticeDeleteForm(HttpServletRequest requset) {
		ModelAndView modelAndView = new ModelAndView();
		int pg =1;
		int endNum = pg*10;
		int startNum = endNum-9;
		
		ArrayList<NoticeDTO> list = (ArrayList<NoticeDTO>)contactService.noticeList(startNum, endNum);
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("tab", "admin_board.jsp");
		modelAndView.addObject("display", "../news/noticeDeleteForm.jsp");
		modelAndView.setViewName("../admin/admin_main.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/noticeDelete")
	public ModelAndView noticeDelete(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		int notice_num = Integer.parseInt(request.getParameter("notice_num"));
		System.out.println(notice_num);
		int result = contactService.noticeDelete(notice_num);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("../news/noticeDelete.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/faqInsertForm")
	public ModelAndView faqInsertForm(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		ArrayList<CategoryDTO> list =  (ArrayList<CategoryDTO>)contactService.getCategory();
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("tab", "admin_board.jsp");
		modelAndView.addObject("display", "../faq/faqInsertForm.jsp");
		modelAndView.setViewName("../admin/admin_main.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/faqInsert")
	public ModelAndView faqInsert(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		String faq_subject = request.getParameter("faq_subject");
		String faq_content = request.getParameter("faq_content");
		String category_name = request.getParameter("where");
		
		FaqDTO faqDTO = new FaqDTO();
		faqDTO.setCategory_name(category_name);
		faqDTO.setFaq_subject(faq_subject);
		faqDTO.setFaq_content(faq_content);
		
		int result = contactService.faqInsert(faqDTO);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("../faq/faqInsert.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/faqDeleteForm")
	public ModelAndView faqDeleteForm(HttpServletRequest requset) {
		ModelAndView modelAndView = new ModelAndView();
		int pg =1;
		int endNum = pg*10;
		int startNum = endNum-9;
		
		ArrayList<FaqDTO> list = (ArrayList<FaqDTO>)contactService.faqList(startNum, endNum);
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("tab", "admin_board.jsp");
		modelAndView.addObject("display", "../faq/faqDeleteForm.jsp");
		modelAndView.setViewName("../admin/admin_main.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/faqDelete")
	public ModelAndView faqDelete(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		int faq_num = Integer.parseInt(request.getParameter("faq_num"));
		System.out.println(faq_num);
		int result = contactService.faqDelete(faq_num);
		
		modelAndView.addObject("result", result);
		modelAndView.setViewName("../faq/faqDelete.jsp");
		
		return modelAndView;
	}
}
