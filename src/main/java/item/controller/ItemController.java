package item.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import category.bean.CategoryDTO;
import category.dao.CategoryDAO;
import item.bean.ItemDTO;
import item.bean.ReviewDTO;

@Controller
public class ItemController {

	@Autowired
	private ItemService itemService;
	@Autowired
	private CategoryDAO dao;
	
	
	/**상품평목록 불러오기*/
	@RequestMapping(value="/main/reviewList")
	public @ResponseBody List<ReviewDTO> reviewList(HttpServletRequest request) {
		System.out.println("[상품평목록 불러오기]");
		
		List<ReviewDTO> list = null;
		int item_num = 0;
		if(request.getParameter("item_num")!=null) {
			item_num = Integer.parseInt(request.getParameter("item_num"));
			list = itemService.reviewList(item_num);
		}
		
		return list;
	}
	
	
	
	/**상품평 등록*/
	@RequestMapping({"/main/reviewWrite", "/member/reviewWrite"})
	public ModelAndView review_Write(HttpServletRequest request,ReviewDTO reviewDTO) {
		System.out.println("[상품평 등록]");
		
				
		int result = itemService.reviewWrite(reviewDTO);
		
		ModelAndView modelAndView = new ModelAndView( "../member/myPage.jsp" );
		modelAndView.addObject("display", "../item/reviewWrite.jsp");
		modelAndView.addObject("reviewResult",result);
		return modelAndView;
	}
	
	@RequestMapping(value="/main/itemList")
	public ModelAndView itemList(HttpServletRequest request) {
		System.out.println("[아이템 리스트 출력]");
		// 데이터
		int i_category = 1;
		String str_category = request.getParameter("category");
		if(str_category!=null) i_category = Integer.parseInt(str_category);
		
		
		ArrayList<ItemDTO> list = (ArrayList<ItemDTO>) itemService.itemList(i_category);
		int totalA = itemService.getTotalA(i_category);	// 총글수 (Total Article number)
		
		List<CategoryDTO> categorylist = dao.getAllCategory();
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("totalA", totalA);
		modelAndView.addObject("categorylist", categorylist);
		modelAndView.addObject("list", list);
		modelAndView.addObject("display", "../item/itemList.jsp");
		modelAndView.setViewName("../main/main.jsp");
		//modelAndView.setViewName("../item/itemList.jsp");
		return modelAndView;
	}
	
	@RequestMapping({"/main/itemAddForm","/admin/itemAddForm"})
	public ModelAndView itemAddForm(HttpServletRequest request) {
		System.out.println("[아이템 등록 화면]");
		
		List<CategoryDTO> categorylist = dao.getAllCategory();
		
		String url = request.getRequestURI();
		int index = url.indexOf("ca2ke");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("categorylist", categorylist);		

		if(url.substring(index+6, index+11).equals("admin")) {

			modelAndView.addObject("tab", "admin_item.jsp");
			modelAndView.addObject("display","../item/itemAddForm.jsp");
			modelAndView.setViewName("../admin/admin_main.jsp");
		}else {
			modelAndView.addObject("display2", "../item/itemAddForm.jsp");
			modelAndView.setViewName("../main/main.jsp");	
		}
		
		return modelAndView;
	}
	
	@RequestMapping({"/main/itemAdd","/admin/itemAdd"})
	public ModelAndView itemAdd(ItemDTO itemDTO, MultipartFile img){
		System.out.println("[아이템 등록]");
		 	File file1 = new File("");
	        String rootPath = file1.getAbsoluteFile().getAbsolutePath();//27
	        String workspacePath = rootPath.substring(0,rootPath.indexOf("sts-bundle"))+
	        		"workspace\\ca2ke\\src\\main\\webapp\\storage";  //각 컴퓨터마다 재확인 할 것! 
	        System.out.println("현재 workspace의 경로 : "+workspacePath );

		String filePath=workspacePath;
		                 
		String fileName = img.getOriginalFilename();

		File file = new File(filePath, fileName);
		try {
			FileCopyUtils.copy(img.getInputStream(), new FileOutputStream(file));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		itemDTO.setItem_image(fileName);
				
		int result = itemService.itemAdd(itemDTO);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("category", itemDTO.getI_category());
		modelAndView.addObject("result", result);
		//modelAndView.addObject("display", "../item/itemList?category="+itemDTO.getI_category());
		modelAndView.setViewName("../item/itemAdd.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="/admin/activationList")
	public ModelAndView itemList() {
		ArrayList<ItemDTO> list = (ArrayList<ItemDTO>) itemService.activationList();

		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", list);
		modelAndView.addObject("tab", "admin_item.jsp");
		modelAndView.addObject("display", "../item/itemActivationList.jsp");
		modelAndView.setViewName("admin_main.jsp");
		return modelAndView;
	}

	@RequestMapping(value="/admin/activationChange")
	public ModelAndView activationChange(int item_num, int item_ongoing) {
		itemService.activationChange(item_num, item_ongoing);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("activationList");
		return modelAndView;
	}
	
}

