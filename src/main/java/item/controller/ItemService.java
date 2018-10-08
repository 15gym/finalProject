package item.controller;

import java.util.List;

import item.bean.ItemDTO;
import item.bean.ReviewDTO;

public interface ItemService {
	public List<ItemDTO> itemList(int i_category);

	public int getTotalA(int i_category);

	public int itemAdd(ItemDTO itemDTO);
	
	public int activationChange(int item_num, int item_ongoing);

	public List<ItemDTO> activationList();
	
	public int reviewWrite(ReviewDTO reviewDTO);

	public List<ReviewDTO> reviewList(int item_num);
}
