package cart.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cart.bean.CartInDTO;
import cart.bean.CartListDTO;
import member.bean.MemberDTO;
import member.controller.MemberService;
import order.bean.OrderlistInDTO;
import order.controller.OrderlistService;

@Controller
public class CartController {
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private OrderlistService orderlistService;
	
	
	/**장바구니에 물품 추가*/
	@RequestMapping(value="/main/cartAdd")
	public @ResponseBody CartInDTO cartAdd(HttpServletRequest request, HttpServletResponse response, ModelAndView modelAndView, CartInDTO cartInDTO) {
		System.out.println("[장바구니 물품추가]");
		
		int i_category = 1;
		String str_category = request.getParameter("category");
		if(str_category!=null) i_category = Integer.parseInt(str_category);
		
		//세션에서 아이디 추출
		String m_id = null;
		HttpSession session = request.getSession();
		if (session.getAttribute("memId")!=null) {
			m_id = (String) session.getAttribute("memId");
		};
		
		cartInDTO.setM_id(m_id);
		System.out.println("m_id: "+m_id);
		int result = 0;
		//해당 아이디로 장바구니에 담은 항목이 있는지 확인 후 리스트 담기
		if (m_id!=null) {
			result = cartService.addCart(cartInDTO);
			
		}
		System.out.println(cartInDTO.getItem_tot());
		
/*		modelAndView.addObject("result",result);
		modelAndView.addObject("display", "../item/itemList?category="+i_category);
		modelAndView.setViewName("../main/main.jsp");*/
		
		return cartInDTO;
	}
	
	/**장바구니로 이동 (장바구니 진입 시 목록 출력)*/
	@RequestMapping(value="/main/cart")
	public ModelAndView cartPage(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[장바구니 페이지로 이동]");
		
		int cartTotal=0; //아이디별 장바구니 개수
		List<CartListDTO> cartList = new ArrayList<CartListDTO>(); //장바구니 목록
		
		//세션에서 아이디 추출
		String m_id = null;
		HttpSession session = request.getSession();
		if (session.getAttribute("memId")!=null) {
			m_id = (String) session.getAttribute("memId");
			System.out.println("m_id: "+m_id);
		};

		//해당 아이디로 장바구니에 담은 항목이 있는지 확인 후 리스트 담기
		if (m_id!=null) {
			cartTotal = cartService.totalCart(m_id);
			
			if (cartTotal>0) {
				cartList = cartService.listCart(m_id);
				modelAndView.addObject("cartList", cartList);
			}
		}
		
		modelAndView.addObject("cartTotal", cartTotal);
		modelAndView.addObject("display2", "../cart/cart.jsp");
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
	}

	
	/**결제준비 화면으로 이동*/
	@RequestMapping(value="/main/orderReady")
	public ModelAndView orderReady(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[결제 준비 페이지로 이동]");
		
		//데이터 전달받기
		String m_id = request.getParameter("m_id");
		
		//장바구니 리스트 받기
		List<CartListDTO> cartList = new ArrayList<CartListDTO>();
		cartList = cartService.listCart(m_id);
		
		//회원정보 추출
		MemberDTO memberDTO = memberService.modifyView(m_id);
		
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.addObject("cartList", cartList);
		modelAndView.addObject("display2", "../cart/orderReady.jsp");
		modelAndView.setViewName("../main/main.jsp");
		
		return modelAndView;
	}
	
	/**결제 화면으로 이동*/
	@RequestMapping(value="/main/orderConfirm")
	public ModelAndView orderConfirm(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[결제 완료 페이지로 이동]");
		
		//데이터 전달 받기
		try {			
			request.setCharacterEncoding("UTF-8");
		} catch(IOException e) {
			e.printStackTrace();
		}
		String m_id = request.getParameter("m_id");
		String paymentType = request.getParameter("paymentType");
		String bank= (String) request.getParameter("bank");
		int sum = Integer.parseInt(request.getParameter("sum"));
		
		//장바구니 리스트를 오더리스트에 업데이트 & 장바구니 정보 삭제
		List<CartInDTO> cartList = new ArrayList<CartInDTO>();
		cartList = cartService.listCart_order(m_id);
		
		OrderlistInDTO orderlistInDTO = null;
		List<CartListDTO> buyList = new ArrayList<CartListDTO>();
		
		for (int i=0; i<cartList.size();i++) {
			orderlistInDTO = new OrderlistInDTO();
			CartInDTO cartInDTO = cartList.get(i);
			orderlistInDTO.setCart_num(cartInDTO.getCart_num());
			orderlistInDTO.setM_id(m_id);
			if (paymentType.equals("card")) { //카드 결제인 경우 [입금완료]
				orderlistInDTO.setPayment("카드");
				orderlistInDTO.setO_status(2);
			} else { //무통장 입금일 경우 [입금대기]
				orderlistInDTO.setPayment("현금");
				System.out.println("bank: "+bank);
				orderlistInDTO.setO_status(1);
			}
			
			//오더리스트 등록
			orderlistService.addOrderlist1(orderlistInDTO);
			orderlistService.addOrderlist2(cartInDTO);
		
			
			//결제완료 페이지로 전달할 구매리스트에 주문내역 추가
			//buyList.get(0).getItem_name();
			buyList.add(cartService.getCart(cartInDTO.getCart_num()));
			System.out.println("장바구니#: "+cartInDTO.getCart_num());
			System.out.println("상품명: "+buyList.get(i).getItem_name());
			
			//장바구니 삭제
			cartService.deleteCart(cartInDTO.getCart_num());
		}
		
		
		modelAndView.addObject("buyList", buyList); //구매목록 전달
		System.out.println("buylist사이즈: "+buyList.size());
		modelAndView.addObject("sum", sum); //총액 전달
		modelAndView.addObject("bank", bank); //카드명 / 은행명 전달
		
		if (paymentType.equals("card")) {
			modelAndView.addObject("display2", "../cart/orderConfirm_card.jsp");
			modelAndView.setViewName("../main/main.jsp");
		} else {
			//계좌번호 - 랜덤: (최대값-최소값+1)+최소값
			String account_num = "";
			for (int i=0; i<15; i++) {
				int num = (int)(Math.random()*(10-1+1)); //계좌번호용 랜덤숫자
				account_num += num;
				if (i==5 || i==7) {
					account_num+="-";
				}
			}
			modelAndView.addObject("account_num", account_num);
			modelAndView.addObject("display2", "../cart/orderConfirm_account.jsp");
			modelAndView.setViewName("../main/main.jsp");
		}
		
		return modelAndView;
	}
	
	/**장바구니 - 주문 수량 수정*/
	@RequestMapping(value="/main/changeQty")
	public ModelAndView changeQty(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[장바구니 수량 수정]");
		
		int cart_num = Integer.parseInt(request.getParameter("cart_num"));
		int item_qty = Integer.parseInt(request.getParameter("item_qty"));
		int item_num = Integer.parseInt(request.getParameter("item_num"));
		int result = cartService.updateCart(item_qty, cart_num, item_num);
		
		modelAndView.addObject("change_result", result);
		modelAndView = cartPage(request, modelAndView);
		
		return modelAndView;
	}
	
	/**장바구니 - 특정 장바구니 삭제 (장바구니# 기준) */
	@RequestMapping(value="/main/deleteCart")
	public ModelAndView deleteCart(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[장바구니 수량 삭제]");
		
		int cart_num = Integer.parseInt(request.getParameter("cart_num"));
		int result = cartService.deleteCart(cart_num);
		
		modelAndView.addObject("delete_result", result);
		modelAndView = cartPage(request, modelAndView);
		
		return modelAndView;
	}
	
	
	/**장바구니로 이동 (장바구니 진입 시 목록 출력)*/
	@RequestMapping(value="/main/cart2")
	public ModelAndView cartPage2(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[장바구니 페이지로 이동2]");
		
		
		modelAndView = cartPage(request, modelAndView);
		modelAndView.addObject("display", "../cart/cart.jsp");
		modelAndView.setViewName("../member/myPage.jsp");
		
		return modelAndView;
	}
	
}

