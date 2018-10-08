package qna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import qna.bean.QnaDTO;
import qna.dao.QnaDAO;

@Service
public class QnaServiceImpl implements QnaService{
	
	@Autowired
	private QnaDAO qnaDAO;

	@Override
	public int insertQna(QnaDTO qnaDTO) {
		return qnaDAO.insertQna(qnaDTO);
	}

	@Override
	public int replyQna(QnaDTO qnaDTO) {
		return qnaDAO.replyQna(qnaDTO);
	}

	@Override
	public int updateHit(int qna_num) {
		return qnaDAO.updateHit(qna_num);
	}

	@Override
	public QnaDTO viewQna(int qna_num) {
		return qnaDAO.viewQna(qna_num);
	}

	@Override
	public List<QnaDTO> qnaList(int startNum, int endNum) {
		return qnaDAO.qnaList(startNum, endNum);
	}

	@Override
	public List<QnaDTO> qnaList_admin(int startNum, int endNum) {
		return qnaDAO.qnaList_admin(startNum, endNum);
	}

	@Override
	public int getQnalist() {
		return qnaDAO.getQnalist();
	}

	@Override
	public int deleteQna(int qna_num) {
		return qnaDAO.deleteQna(qna_num);
	}
}
