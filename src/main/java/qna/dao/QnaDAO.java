package qna.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import qna.bean.QnaDTO;

@Repository
public class QnaDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	//새 문의글 등록 (회원)
	public int insertQna(QnaDTO qnaDTO) {
		return sqlSession.insert("mybatis.qnaMapper.insertQna", qnaDTO);
	}
	
	//답글 등록 (관리자)
	public int replyQna(QnaDTO qnaDTO) {
		return sqlSession.update("mybatis.qnaMapper.replyQna", qnaDTO);
	}

	//조회수 증가
	public int updateHit(int qna_num) {
		return sqlSession.update("mybatis.qnaMapper.updateHit", qna_num);
	}
	
	//내용 조회
	public QnaDTO viewQna(int qna_num) {
		return sqlSession.selectOne("mybatis.qnaMapper.viewQna", qna_num);
	}
	
	//전체 리스트 출력 - 회원용
	public List<QnaDTO> qnaList (int startNum, int endNum){
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum",  startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.qnaMapper.qnaList", map);
	}
	
	//전체 리스트 출력 - 관리자용
	public List<QnaDTO> qnaList_admin (int startNum, int endNum){
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum",  startNum);
		map.put("endNum", endNum);
		return sqlSession.selectList("mybatis.qnaMapper.qnaList_admin", map);
	}
	
	//전체 리스트 개수
	public int getQnalist() {
		return sqlSession.selectOne("mybatis.qnaMapper.getQnalist");
	}
	
	//글 삭제
	public int deleteQna(int qna_num) {
		return sqlSession.delete("mybatis.qnaMapper.deleteQna", qna_num);
	}
	
}
