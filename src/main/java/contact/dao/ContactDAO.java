package contact.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import category.bean.CategoryDTO;
import contact.bean.FaqDTO;
import contact.bean.NoticeDTO;
@Repository
public class ContactDAO {
	
	@Autowired
	SqlSessionTemplate sqlsession;

	
	public List<NoticeDTO> noticeList(int startNum, int endNum){
		Map<String, Integer> map = new HashMap<>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return  sqlsession.selectList("notice.mapper.noticeList", map);
	}
	
	public int getTotalA() {
		return sqlsession.selectOne("notice.mapper.getTotalA");
	}
	public int noticeInsert(NoticeDTO noticeDTO) {
		return sqlsession.insert("notice.mapper.noticeInsert", noticeDTO);
	}
	
	public List<FaqDTO> faqList(int startNum, int endNum){
		Map<String , Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		return sqlsession.selectList("mybatis.faqMapper.faqList", map);
	}
	
	public int noticeDelete(int notice_num) {
		return sqlsession.delete("notice.mapper.noticeDelete", notice_num);
	}
	
	public List<CategoryDTO> getCategory(){
		return sqlsession.selectList("mybatis.faqMapper.getCategory");
	}
	
	public int faqInsert(FaqDTO faqDTO) {
		return sqlsession.insert("mybatis.faqMapper.faqInsert",faqDTO);
	}
	public int faqDelete(int faq_num) {
		return sqlsession.delete("mybatis.faqMapper.faqDelete", faq_num);
	}
}
