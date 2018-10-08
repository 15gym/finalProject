package qna.controller;

import java.util.List;

import qna.bean.QnaDTO;

public interface QnaService {
	
	//새 문의글 등록 (회원)
	int insertQna(QnaDTO qnaDTO);
	
	//답글 등록 (관리자)
	int replyQna(QnaDTO qnaDTO);
	
	//조회수 증가
	int updateHit(int qna_num);
	
	//내용 조회
	QnaDTO viewQna(int qna_num);
	
	//전체 리스트 출력 -회원용
	List<QnaDTO> qnaList (int startNum, int endNum);
	
	//전체 리스트 출력 -관리자용
	List<QnaDTO> qnaList_admin (int startNum, int endNum);
	
	//전체 리스트 개수
	int getQnalist();
	
	//글 삭제
	int deleteQna(int qna_num);
	
}
