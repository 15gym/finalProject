package order.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.http.HttpRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import category.bean.CategoryDTO;
import category.dao.CategoryDAO;
import item.bean.ItemDTO;
import item.controller.ItemService;
import javafx.scene.control.DatePicker;
import order.bean.OrderlistListDTO;
import order.bean.OrderlistSalesDTO;

@Controller
public class OrderlistController {


	@Autowired
	private CategoryDAO catDAO;
	@Autowired
	private OrderlistService orderlistService;
	@Autowired
	private ItemService itemService;
	
	
	
	/**주문관리목록 - 엑셀 다운로드*/
	@RequestMapping(value="/admin/excelDown_orderlist")
	public ModelAndView excelDown_orderlist(@ModelAttribute( "command" ) OrderlistListDTO dto) {
		System.out.println("[엑셀 다운]");
		ModelAndView modelAndView = new ModelAndView( "../order/excelDownload_order.jsp" );
		List<OrderlistListDTO> list = orderlistService.orderlist_ing_all();
		System.out.println("list크기: "+list.size());
		modelAndView.addObject("list",list);
		 
		return modelAndView;
	}
	
	
	/**매출목록(완료된 주문) - 엑셀 다운로드*/
	@RequestMapping({"/admin/excelDown_saleslist", "/order/excelDown_saleslist"})
	public ModelAndView excelDown_saleslist(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[엑셀 다운2]");
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", request.getParameter("sales_cat"));
		map.put("item_num", request.getParameter("sales_item"));
		map.put("payment", request.getParameter("payment_str"));
		
		if (request.getParameter("m_id")==null||request.getParameter("m_id").equals("0")) {
			map.put("m_id", "");
		} else {
			map.put("m_id", request.getParameter("m_id"));
		}
		
		if (request.getParameter("datepicker1")==null||request.getParameter("datepicker1").equals("0")) {
			map.put("date1", "");
			map.put("date2", "");
		} else {
			map.put("date1", request.getParameter("datepicker1"));
			map.put("date2", request.getParameter("datepicker2"));
		}
		
		if (request.getParameter("o_num")==null||request.getParameter("o_num").equals("0")) {
			map.put("o_num", "0");
		} else {
			map.put("o_num", request.getParameter("o_num"));
		}
		
		System.out.println("category:"+request.getParameter("sales_cat"));
		System.out.println("item_num:"+request.getParameter("sales_item"));
		System.out.println("payment:"+request.getParameter("payment_str"));
		System.out.println("m_id:"+request.getParameter("m_id"));
		System.out.println("date1:"+request.getParameter("datepicker1"));
		System.out.println("date2:"+request.getParameter("datepicker2"));
		System.out.println("o_num:"+request.getParameter("o_num"));
		
		List<OrderlistListDTO> list = orderlistService.salesList_all(map);
		int listCount = orderlistService.getSalesList(map);
		int total = 0;
		if (listCount >0) {
			total = orderlistService.salesTot(map);
		}
		
		System.out.println("listCount:"+listCount);
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("listCount", listCount);
		modelAndView.addObject("total", total);
		modelAndView.setViewName("../order/excelDownload_sales.jsp");
		 
		return modelAndView;
	}
	
	
	
	/**주문관리 (완료되지 않은 주문 목록)*/
	@RequestMapping(value="/admin/currentOrder")
	public ModelAndView currentOrder(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[주문관리 목록]");
		
		//1. 페이지 정보 추출
		int pg = 1;
		if (request.getParameter("pg")!=null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}
		
		int o_num = 0;
		if (request.getParameter("o_num")!=null) {
			o_num = Integer.parseInt(request.getParameter("o_num"));
		}
		
		//2. DB 연동 처리
		//데이터 처리
		List<OrderlistListDTO> orderlist = new ArrayList<OrderlistListDTO>();
		int maxPage = 0, startPage=0, endPage=0;
		
		//DB - 1페이지 당 10개씩 출력 (동작 테스트 시 3개씩 출력)
		int limit = 10; //한 페이지 당 출력할 글 개수
		int endNum =  pg*limit; //마지막 글 번호
		int startNum = endNum-(limit-1); //시작 글 번호
		
		//DB에서 목록 가져오기
		orderlist = orderlistService.orderlist_ing(startNum, endNum);
		
		//페이징 처리
		int listCount = orderlistService.getOrderlist_ing(); //미완료 주문 개수
		maxPage = (listCount+limit-1)/limit;
		startPage = (pg-1)/3*3+1;
		endPage = startPage+2;
		if (maxPage < endPage) endPage = maxPage;
		
		//3. 화면 네비게이션
		modelAndView.addObject("orderlist", orderlist);
		modelAndView.addObject("listCount", listCount);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("maxPage", maxPage);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("o_num",o_num);
		modelAndView.addObject("tab", "admin_order.jsp");
		modelAndView.addObject("display", "../order/orderlist.jsp");
		modelAndView.setViewName("../admin/admin_main.jsp");

		
		return modelAndView;
	}
	
	/**주문현황 업데이트 (select에서 선택) */
	@RequestMapping(value="/admin/orderUpdate")
	public ModelAndView orderUpdate(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[주문현황 업데이트]");
		
		int pg = Integer.parseInt(request.getParameter("pg"));
		int o_status = Integer.parseInt(request.getParameter("o_status"));
		int o_num = Integer.parseInt(request.getParameter("o_num"));
		
		int result = orderlistService.updateStatus(o_status, o_num);
		
		modelAndView.addObject("result",result);
		modelAndView = currentOrder(request, modelAndView);
		return modelAndView;
	}
	
	/**픽업시간 업데이트 & 주문 완료*/
	@RequestMapping(value="/admin/pickup")
	public ModelAndView pickup(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[픽업시간 업데이트 & 주문 완료");
		
		int pg = Integer.parseInt(request.getParameter("pg"));
		int o_num = Integer.parseInt(request.getParameter("o_num"));
		
		int p_result = orderlistService.pickup(o_num);
		
		modelAndView.addObject("p_result", p_result);
		modelAndView = currentOrder(request, modelAndView);
		return modelAndView;
	}
	
	/**주문 취소 (아이템수량 & 총액 0으로 변경) - 주문목록에서 관리자가 취소시킬 경우*/
	@RequestMapping(value="/admin/orderCancel")
	public ModelAndView orderCancel(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[주문취소]");
		
		int pg = Integer.parseInt(request.getParameter("pg"));
		int o_num = Integer.parseInt(request.getParameter("o_num"));
		
		int c_result = orderlistService.orderCancel(o_num);
		
		modelAndView.addObject("c_result", c_result);
		modelAndView = currentOrder(request, modelAndView);
		return modelAndView;
	}
	
	/**주문 취소 (아이템수량 & 총액 0으로 변경) - 구매목록에서 회원이 취소시킬 경우*/
	@RequestMapping(value="/main/orderCancel_user")
	public ModelAndView orderCancel_user(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[사용자 주문취소]");
		
		int pg = Integer.parseInt(request.getParameter("pg"));
		int o_num = Integer.parseInt(request.getParameter("o_num"));
		
		int c_result = orderlistService.orderCancel(o_num);
		
		modelAndView.addObject("c_result", c_result);
		modelAndView = myOrder(request, modelAndView);
		return modelAndView;
	}
	
	
	/**매출 목록 (주문 완료된 목록)*/
	@RequestMapping(value="/admin/salesList")
	public ModelAndView salesList(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[매출 목록 페이지로 이동]");

		//카테고리 목록
		List<CategoryDTO> catList = catDAO.getAllCategory();

		//한달간 일별 매출 목록
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
		String date2 = date.format(today); //오늘 날짜 (검색 종료일)
		Calendar cal = Calendar.getInstance();
		cal.add(cal.MONTH, -1);
		//검색 시작일 (한달 전)
		String date1 = cal.get(cal.YEAR)+"/"+(cal.get(cal.MONTH)+1)+"/"+cal.get(cal.DATE);
		System.out.println("Date1:"+date1);
		System.out.println("Date2:"+date2);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("startDate", date1);
		map.put("endDate", date2);

		List<OrderlistSalesDTO> dailySalesList = orderlistService.dailySales(map);
				
		modelAndView.addObject("catList", catList);
		modelAndView.addObject("tab", "admin_account.jsp");
		modelAndView.addObject("dailySalesList", dailySalesList);
		modelAndView.addObject("display", "../order/salesList.jsp");
		modelAndView.setViewName("../admin/admin_main.jsp");
		
		return modelAndView;
	}
	
	
	/**카테고리별 아이템 목록 가져오기 (AJAX로 호출)*/
	@RequestMapping(value="/admin/getItemList")
	@ResponseBody
	public ModelAndView getItemList(HttpServletRequest request, ModelAndView modelAndView) {
		
		int i_category = Integer.parseInt(request.getParameter("i_category"));
		
		List<ItemDTO> itemList = itemService.itemList(i_category); 
		request.setAttribute("itemList", itemList);
		System.out.println("**getItemList - 동작 테스트**");
		for (int i=0;i<itemList.size();i++) {
			System.out.println(itemList.get(i).getItem_name());
		}
		
		modelAndView.addObject("itemList", itemList);
		//modelAndView.setViewName("jsonView");
		modelAndView.setViewName("/order/getItemListResult.jsp");
		//return itemList;
		return modelAndView;
	}
	
	
	/**선택값에 따라 매출 리스트 가져오기*/
	@RequestMapping(value="/admin/getSalesList")
	public ModelAndView getSalesList(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[매출 목록2]");
		
		//[1. 데이터 전달 받기]
		int category = 0;
		if (!request.getParameter("sales_cat").equals("0")) {
			category = Integer.parseInt(request.getParameter("sales_cat"));
		}
		
		int item_num = 0;
		if (!request.getParameter("sales_item").equals("0")) {
			item_num = Integer.parseInt(request.getParameter("sales_item"));
		}
		
		//Map<String, String>에 넣기 위해 String으로 형변환
		//String category = Integer.toString(category_int);
		//String item_num = Integer.toString(item_num_int);
		
		//날짜값 받아서 포맷 수정 (yyyy-mm-dd)
		String datepicker1 = "0";
		String date1= "";
		StringBuffer sb1 = null;
		System.out.println("datepicker111: "+request.getParameter("datepicker1"));
		if (request.getParameter("datepicker1")!=null || !(request.getParameter("datepicker1").equals("0"))||!(request.getParameter("datepicker1").equals(" ")) ) {
			datepicker1 = request.getParameter("datepicker1").trim();
			System.out.println("datepicker122: "+request.getParameter("datepicker1"));
			if (datepicker1.length()==8) {
				System.out.println("datepicker1: "+datepicker1);
				sb1 = new StringBuffer(datepicker1);
				sb1.insert(4, "-");
				sb1.insert(7, "-");
				date1 = sb1.toString();
				}
		};
		if (datepicker1.equals("")) {
			datepicker1 = "0";
		}
		
		String datepicker2 = "0";
		String date2="";
		StringBuffer sb2 = null;
		System.out.println("datepicker222: "+request.getParameter("datepicker2"));
		if (request.getParameter("datepicker2")!=null || !(request.getParameter("datepicker2").equals("0"))||!(request.getParameter("datepicker2").equals(" ")) ) {
			datepicker2 = request.getParameter("datepicker2").trim();
			sb2 = new StringBuffer(datepicker2);
			if (datepicker2.length()==8) {
				System.out.println("datepicker2: "+datepicker2);
				sb2.insert(4, "-");
				sb2.insert(7, "-");
				date2 = sb2.toString();
			}
		};
		if (datepicker2.equals("")) {
			datepicker2 = "0";
		}
		
		// - payment_str >> 카드 결제: 1, 현금 결제: 2, 모두: 12
		String payment_str = "0";
		/*if((!request.getParameter("payment_str").equals("")) || request.getParameter("payment_str")!=null) {
			payment_str = request.getParameter("payment_str");
		}*/
		String[] payment = null;
		if (request.getParameter("payment_str")!=null){ 
			payment_str = request.getParameter("payment_str");
		} else {
			payment = request.getParameterValues("payment");
			payment_str = " ";
			for (String i : payment) {
				payment_str += i;
				System.out.println("payment: "+i);
			}
		}
		
		String m_id = "";
		String m_id2 = "0";
		if (!request.getParameter("m_id").equals("") || !request.getParameter("m_id").equals("0")) {
			m_id= request.getParameter("m_id");
		}
		if (m_id.equals("")||m_id.equals("0")) {
			m_id="";
			m_id2 = "0";
		} else {
			m_id2 = m_id;
		}
		System.out.println("m_id:"+m_id);
		System.out.println("m_id2:"+m_id2);
		
		String o_num = "0";
		//String o_num2 = "0";
		if (!request.getParameter("o_num").equals("")) {
			o_num= request.getParameter("o_num");
		}
		//if (o_num.equals("")) {
		//	o_num2= "0";
		//}

		System.out.println("i_category: "+category);
		System.out.println("item_num: "+item_num);
		System.out.println("date1: "+date1);
		//System.out.println("sb1: "+sb1);
		System.out.println("m_id: "+m_id);
		System.out.println("payment_str: "+payment_str);
			
		int pg = 1;
		if (request.getParameter("pg")!=null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		};
		System.out.println("pg: "+pg);
		
		
		//[2. DB 연동]
	
		// 1페이지 당 10개씩 출력 (동작 테스트 시 3개씩 출력)
		int maxPage = 0, startPage=0, endPage=0;
		int limit = 10; //한 페이지 당 출력할 글 개수
		int endNum_int =  pg*limit; //마지막 글 번호
		int startNum_int = endNum_int-(limit-1); //시작 글 번호
		String endNum = Integer.toString(endNum_int);
		String startNum = Integer.toString(startNum_int);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("category", category);
		map.put("item_num", item_num);
		map.put("payment", payment_str);
		map.put("m_id", m_id);
		map.put("date1", date1);
		map.put("date2", date2);
		map.put("o_num", o_num);
		map.put("startNum",  startNum);
		map.put("endNum",  endNum);

		//DB에서 목록 가져오기
		List<CategoryDTO> catList = catDAO.getAllCategory(); //카테고리 목록 (select박스 용)
		List<ItemDTO> itemList = itemService.itemList(category);
		List<OrderlistListDTO> salesList = orderlistService.salesList(map);
		System.out.println("salesList 수: "+salesList.size());
		int total  = 0;
		if (salesList.size()>0) {
			total = orderlistService.salesTot(map);
		}

		//페이징 처리
		int listCount = orderlistService.getSalesList(map); //완료된 주문 개수
		maxPage = (listCount+limit-1)/limit;
		startPage = (pg-1)/3*3+1;
		endPage = startPage+2;
		if (maxPage < endPage) endPage = maxPage;

		//3. 화면 네비게이션
		modelAndView.addObject("salesList", salesList);
		modelAndView.addObject("listCount", listCount);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("maxPage", maxPage);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("total", total);
		
		modelAndView.addObject("sales_cat", category);
		modelAndView.addObject("sales_item", item_num);
		modelAndView.addObject("datepicker1", datepicker1);
		System.out.println("datepicker1:"+datepicker1+"[][][]");
		modelAndView.addObject("datepicker2", datepicker2);
		modelAndView.addObject("payment_str", payment_str);
		//modelAndView.addObject("m_id", m_id);
		modelAndView.addObject("m_id2", m_id2);
		modelAndView.addObject("o_num", o_num);
		
		modelAndView.addObject("catList", catList);
		modelAndView.addObject("itemList", itemList);
		modelAndView.addObject("display", "../order/salesList.jsp");
		modelAndView.addObject("tab", "admin_account.jsp");
		modelAndView.addObject("paging", "paging");
		modelAndView.addObject("salesDisplay", "../order/salesListFormat.jsp");
		modelAndView.setViewName("../admin/admin_main.jsp");
		
		return modelAndView;
	}
	
	/**구매 목록 (아이디별 구매 목록)*/
	@RequestMapping({"/main/myOrder", "/member/myOrder"})
	public ModelAndView myOrder(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[개인별 구매 목록]");
		
		//1. 페이지 정보 추출
		int pg = 1;
		if (request.getParameter("pg")!=null) {
			pg = Integer.parseInt(request.getParameter("pg"));
		}
		
		String m_id = null;
		HttpSession session = request.getSession();
		if (session.getAttribute("memId")!=null) {
			m_id = (String) session.getAttribute("memId");
			System.out.println("m_id: "+m_id);
		}
		
		//2. DB 연동 처리
		//데이터 처리
		List<OrderlistListDTO> myOrder = new ArrayList<OrderlistListDTO>();
		int maxPage = 0, startPage=0, endPage=0;
		
		//DB - 1페이지 당 10개씩 출력 (동작 테스트 시 3개씩 출력)
		int limit = 10; //한 페이지 당 출력할 글 개수
		int endNum =  pg*limit; //마지막 글 번호
		int startNum = endNum-(limit-1); //시작 글 번호
		
		//DB에서 목록 가져오기
		myOrder = orderlistService.orderlist_id(m_id, startNum, endNum);
		int mmCount1 = orderlistService.thisMonthCount(m_id);
		int mmCount2 = orderlistService.prevMonthCount(m_id);
		int mmCount3 = orderlistService.prevMonthCount2(m_id);
		
		//페이징 처리
		int listCount = orderlistService.getOrderlist_id(m_id); //아이디별 구매 개수
		System.out.println("listCount: "+listCount);
		maxPage = (listCount+limit-1)/limit;
		startPage = (pg-1)/3*3+1;
		endPage = startPage+2;
		if (maxPage < endPage) endPage = maxPage;

		
		//3. 화면 네비게이션
		modelAndView.addObject("myOrder", myOrder);
		modelAndView.addObject("listCount", listCount);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("maxPage", maxPage);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("mmCount1", mmCount1);
		modelAndView.addObject("mmCount2", mmCount2);
		modelAndView.addObject("mmCount3", mmCount3);
		modelAndView.addObject("display", "../order/myOrder.jsp");
		modelAndView.setViewName("../member/myPage.jsp");

		
		return modelAndView;
	}
	
}
