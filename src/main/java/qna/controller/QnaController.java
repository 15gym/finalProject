package qna.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import qna.bean.QnaDTO;

@Controller
public class QnaController {
	
	@Autowired
	private QnaService qnaService;
	
	
	/**게시판 페이지로 이동*/
	/*
	@RequestMapping(value="/main/boardMain")
	public ModelAndView boardMain(HttpServletRequest request, ModelAndView modelAndView) {
	
		System.out.println("[게시판 모음 페이지로 이동]");
		modelAndView.addObject("display2", "../qna/boardMain.jsp");
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
	}
	*/
	
	/**문의게시판(회원용)으로 이동*/
	@RequestMapping(value="/main/qnalist")
	public ModelAndView qnalist(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[QNA 목록으로 이동]");
		
		//1. 페이지 정보 추출
		int pg = 1;
		if (request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}
	
		//2. DB 연동 처리
		List<QnaDTO> qnalist = new ArrayList<QnaDTO>();
		int maxPage = 0, startPage=0, endPage=0;
		
		//DB - 1페이지 당 10개씩 출력 (동작 테스트 시 3개씩 출력)
		int limit = 10; //한 페이지 당 출력할 글 개수
		int endNum =  pg*limit; //마지막 글 번호
		int startNum = endNum-(limit-1); //시작 글 번호
		
		
		//DB에서 목록 가져오기
		qnalist = qnaService.qnaList(startNum, endNum);
		
		//페이징 처리
		int listCount = qnaService.getQnalist(); //전체 등록 글 수
		maxPage = (listCount+limit-1)/limit;
		startPage = (pg-1)/3*3+1;
		endPage = startPage+2;
		if (maxPage < endPage) endPage = maxPage;
		
		modelAndView.addObject("qnalist", qnalist);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("maxPage", maxPage);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("display2", "../qna/boardMain.jsp");
		modelAndView.addObject("boardDisplay", "../qna/qnaList.jsp");
		modelAndView.setViewName("../main/main.jsp");
		
		return modelAndView;
	}
	
	/**문의글 입력폼으로 이동*/
	@RequestMapping(value="/main/qnaForm")
	public ModelAndView qnaForm(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[QNA 입력폼 으로 이동]");
		
		modelAndView.addObject("display2", "../qna/boardMain.jsp");
		modelAndView.addObject("boardDisplay", "../qna/qnaWriteForm.jsp");
		modelAndView.setViewName("../main/main.jsp");
		
		return modelAndView;
	}
	
	/**문의글 등록*/
	@RequestMapping(value="/main/qnaSubmit")
	public ModelAndView qnaSubmit(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[QNA 등록]");
		
		//1. 데이터 전달받기
		try {
			request.setCharacterEncoding("utf-8");
		}catch(UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String m_id = request.getParameter("m_id");
		String subject = request.getParameter("subject");
		String qna_type = request.getParameter("qna_type");
		String qna_public = request.getParameter("qna_public");
		String content = request.getParameter("content");
		
		/*
		System.out.println("m_id: "+m_id);
		System.out.println("subject: "+subject);
		System.out.println("qna_type: "+qna_type);
		System.out.println("qna_public: "+qna_public);
		System.out.println("content: "+content);
		*/
		
		QnaDTO dto = new QnaDTO();
		dto.setM_id(m_id);
		dto.setQna_subject(subject);
		dto.setQna_type(qna_type);
		dto.setQna_public(qna_public);
		dto.setQna_content(content);
		
		//2. DB 연동
		int result = qnaService.insertQna(dto);
		
		modelAndView = qnalist(request, modelAndView);
		modelAndView.addObject("result", result);
		
		return modelAndView;
	}
	
	
	/**문의글 상세 보기*/
	@RequestMapping(value="/main/qnaDetail")
	public ModelAndView qnaDetail(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[QNA 상세보기]");
		
		//1. 데이터 전달 받기
		int pg=1;
		if (request.getParameter("pg")!= null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		
		//2. DB 연동
		qnaService.updateHit(qna_num); //조회수 증가
		QnaDTO dto = qnaService.viewQna(qna_num);
		
		modelAndView.addObject("dto",dto);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("display2", "../qna/boardMain.jsp");
		modelAndView.addObject("boardDisplay", "../qna/qnaDetail.jsp");
		modelAndView.setViewName("../main/main.jsp");
		
		return modelAndView;
	}
	
	
	/**문의글 삭제*/
	@RequestMapping(value="/main/qnaDelete")
	public ModelAndView qnaDelete(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[QNA 삭제]");
		
		//1. 데이터 전달 받기
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		
		//2. DB 연동
		int deleteResult = qnaService.deleteQna(qna_num);
		
		modelAndView = qnalist(request, modelAndView);
		modelAndView.addObject("deleteResult", deleteResult);
		
		return modelAndView;
	}
	
	
	/**문의게시판(관리자용)으로 이동*/
	@RequestMapping(value="/admin/qnalist_admin")
	public ModelAndView qnalist_admin(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[QNA 목록(관리자용)으로 이동]");
		
		//1. 페이지 정보 추출
		int pg = 1;
		if (request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}
	
		//2. DB 연동 처리
		List<QnaDTO> qnalist = new ArrayList<QnaDTO>();
		int maxPage = 0, startPage=0, endPage=0;
		
		//DB - 1페이지 당 10개씩 출력 (동작 테스트 시 3개씩 출력)
		int limit = 10; //한 페이지 당 출력할 글 개수
		int endNum =  pg*limit; //마지막 글 번호
		int startNum = endNum-(limit-1); //시작 글 번호
		
		
		//DB에서 목록 가져오기
		qnalist = qnaService.qnaList_admin(startNum, endNum);
		// - 답변 안달린 글 & 먼저 등록된 글이 우선 출력됨
		
		//페이징 처리
		int listCount = qnaService.getQnalist(); //전체 등록 글 수
		maxPage = (listCount+limit-1)/limit;
		startPage = (pg-1)/3*3+1;
		endPage = startPage+2;
		if (maxPage < endPage) endPage = maxPage;
		
		modelAndView.addObject("qnalist", qnalist);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("maxPage", maxPage);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("tab", "admin_board.jsp");
		modelAndView.addObject("display", "../qna/qnaList_admin.jsp");
		modelAndView.setViewName("../admin/admin_main.jsp");
		
		return modelAndView;
	}
	
	/**관리자 - 답글 입력폼으로 이동*/
	@RequestMapping(value="/admin/qnaReplyForm")
	public ModelAndView qnaReplyForm(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[QNA 답변 입력폼으로 이동]");
	
		//1. 데이터 전달 받기
		int pg = 1;
		if (request.getParameter("pg") != null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		
		//2. DB 연동
		qnaService.updateHit(qna_num); //조회수 증가
		QnaDTO dto = qnaService.viewQna(qna_num);
		
		//3. 화면 네비게이션
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("dto", dto);
		modelAndView.addObject("tab", "admin_board.jsp");
		modelAndView.addObject("display", "../qna/qnaReplyForm.jsp");
		modelAndView.setViewName("../admin/admin_main.jsp");
		
		
		return modelAndView;
	}
	
	/**관리자 - 문의글 삭제*/
	@RequestMapping(value="/admin/qnaDelete_admin")
	public ModelAndView qnaDelete_admin(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[QNA 삭제 - 관리자]");

		//1. 데이터 전달 받기
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));

		//2. DB 연동
		int deleteResult = qnaService.deleteQna(qna_num);

		modelAndView = qnalist_admin(request, modelAndView);
		modelAndView.addObject("deleteResult", deleteResult);

		return modelAndView;
	}
	
	/**관리자 - 답변 등록*/
	@RequestMapping(value="/admin/qnaReply")
	public ModelAndView qnaReply(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[QNA 답변등록 - 관리자]");
		
		//1. 데이터 전달 받기
		int pg = 1;
		if (request.getParameter("pg")!= null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}
		
		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		String qna_reply = request.getParameter("qna_reply");
		
		QnaDTO dto = new QnaDTO();
		dto.setQna_num(qna_num);
		dto.setQna_reply(qna_reply);
		
		//2. DB 연동
		int result = qnaService.replyQna(dto);
		
		//3. 화면 네비게이션
		modelAndView = qnalist_admin(request, modelAndView);
		modelAndView.addObject("result", result);
		modelAndView.addObject("pg", pg);
		return modelAndView;
	}
	
	/**관리자 - 내용 확인*/
	@RequestMapping(value="/admin/qnaCheck")
	public ModelAndView qnaCheck(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[QNA 내용 확인 - 관리자]");

		//1. 데이터 전달 받기
		int pg = 1;
		if (request.getParameter("pg")!= null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}

		int qna_num = Integer.parseInt(request.getParameter("qna_num"));
		
		//2. DB 연동
		qnaService.updateHit(qna_num); //조회수 증가
		QnaDTO dto = qnaService.viewQna(qna_num);

		//3. 화면 네비게이션
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("dto", dto);
		modelAndView.addObject("tab", "admin_board.jsp");
		modelAndView.addObject("display", "../qna/qnaDetail_admin.jsp");
		modelAndView.setViewName("../admin/admin_main.jsp");

		return modelAndView;
	}
}
