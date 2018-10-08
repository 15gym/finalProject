package item.dao;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import item.bean.ItemDTO;
import item.bean.ReviewDTO;
@Repository
public class ItemDAO {
	@Autowired	
	private SqlSessionTemplate sqlSession;

	public List<ItemDTO> itemList(int i_category) {
		return sqlSession.selectList("mybatis.item.itemList", i_category);
	
	}
	
	public int getTotalA(int i_category) {
		System.out.println(i_category); 
		return sqlSession.selectOne("mybatis.item.getTotalA", i_category); 

	}

	public int itemAdd(ItemDTO itemDTO) {
		return sqlSession.insert("mybatis.item.itemAdd", itemDTO);
	}
	
	public int activationChange(int item_num, int item_ongoing) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("item_num", item_num);
		map.put("item_ongoing", item_ongoing);
		return sqlSession.update("mybatis.item.activationChange", map);
	}

	public List<ItemDTO> activationList() {
		return sqlSession.selectList("mybatis.item.activationList");
	}
	
	public int reviewWrite(ReviewDTO reviewDTO) {
		return sqlSession.insert("mybatis.item.reviewWrite",reviewDTO);
	}

	public List<ReviewDTO> reviewList(int item_num) {
		return sqlSession.selectList("mybatis.item.reviewList",item_num);
	}
}
