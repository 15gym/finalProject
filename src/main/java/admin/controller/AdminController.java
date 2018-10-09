package admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
		
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import javax.crypto.Cipher;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.SecureRandom;
import java.security.spec.RSAPublicKeySpec;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import admin.bean.AdminDTO;
import member.bean.MemberDTO;
import member.controller.MemberService;

@Controller
public class AdminController {
	private static final String SIGN_KEY = "ca2ke_n4icf";
	
	private static final int DEFAULT_KEY_SIZE = 2048;

	private static final String KEY_FACTORY_ALGORITHM = "RSA";
	
	@Autowired
	AdminService adminService;
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="/main/adminlogin")
	public ModelAndView adminlogin(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("../admin/adminLogin.jsp");
		return modelAndView;
	}
	//경로 테스트 /admin/ < 나중에 /main/변경
	@RequestMapping(value="/admin/adminJoinForm")
	public ModelAndView adminJoinForm(HttpSession session) throws Exception {
		KeyPair pair = generateKeyPair();
		PublicKey publicKey = pair.getPublic();
		PrivateKey privateKey = pair.getPrivate();

		KeyFactory keyFactory = KeyFactory.getInstance("RSA");
	 
		session.setAttribute("_RSA_WEB_Key_", privateKey);   

		RSAPublicKeySpec publicSpec = (RSAPublicKeySpec) keyFactory.getKeySpec(publicKey, RSAPublicKeySpec.class);
		String publicKeyModulus = publicSpec.getModulus().toString(16);
		String publicKeyExponent = publicSpec.getPublicExponent().toString(16);
						 
													
													
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("RSAModulus", publicKeyModulus);
		modelAndView.addObject("RSAExponent", publicKeyExponent);	

		//경로 테스트
		modelAndView.addObject("display", "../admin/adminJoinForm.jsp");
		modelAndView.addObject("tab", "admin_manager.jsp");
		modelAndView.setViewName("admin_main.jsp");
		return modelAndView;
	}
	
	//경로 테스트 /admin/ < 나중에 /main/변경
	@RequestMapping(value="/admin/adminJoin")
	public ModelAndView adminJoin(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrivateKey privateKey = (PrivateKey)session.getAttribute("_RSA_WEB_Key_");
		session.removeAttribute("_RSA_WEB_Key_");
		
		String pwd = request.getParameter("a_pwd");
		String a_pwd = decrypt(pwd, privateKey);
		a_pwd += SIGN_KEY;
		a_pwd = toSha256(a_pwd);
        System.out.println("final hashed:::::::::::\n" + a_pwd);
	
		String a_id = request.getParameter("a_id");
		String a_name= request.getParameter("a_name");
		
		AdminDTO adminDTO = new AdminDTO();
		adminDTO.setA_id(a_id);
		adminDTO.setA_name(a_name);
		adminDTO.setA_pwd(a_pwd);
		int result = adminService.adminJoin(adminDTO);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.addObject("adminDTO", adminDTO);
		/*modelAndView.addObject("display", "../admin/adminJoin.jsp");
		modelAndView.setViewName("../main/main.jsp");*/
		//경로테스트
		modelAndView.setViewName("adminJoin.jsp");
		
		return modelAndView;
	}
	
	//경로 테스트 /admin/ < 나중에 /main/변경
	@RequestMapping("/admin/adminjoinCheckId")
	@ResponseBody
    public Map<Object, Object> idcheck(@RequestBody String a_id) {
	     
        Map<Object, Object> map = new HashMap<Object, Object>();
        
        boolean exist = adminService.adminIdCheck(a_id);
        map.put("exist", exist);
        
        return map;
    }
	
	//회원 목록
	@RequestMapping(value="/admin/adminList")
	public ModelAndView adminListForm(HttpServletRequest request) {
		int pg = Integer.parseInt(request.getParameter("pg"));

		ModelAndView modelAndView = new ModelAndView();
		
		int limit = 10;
		int endNum = pg*limit;
		int startNum = endNum-(limit-1);
		
		ArrayList<MemberDTO> list = (ArrayList<MemberDTO>)adminService.memberList(startNum, endNum);
		
		int totalA = adminService.getTotalA();	
		int totalP = (totalA+limit-1) / limit;				

		int startPage = (pg-1)/3*3+1;	
		int endPage = startPage + 2;
		if(totalP < endPage) endPage = totalP;
		
		
		modelAndView.addObject("list", list);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("pg",pg);
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("tab", "admin_member.jsp");
		modelAndView.addObject("display","adminList.jsp");
		modelAndView.setViewName("../admin/admin_main.jsp");
	
		return modelAndView;
	}
	
	
	@RequestMapping(value="/admin/memberNameANDId")
	public ModelAndView memberNameANDId(HttpServletRequest request) {
		int pg = 1;
		String keyword = request.getParameter("keyword");
		
		// 1이면 이름값 날라오고 2면 아이디값 으로 판단  null이면 회원목록
		String keywordCheck = request.getParameter("keywordCheck");
		
		System.out.println(pg);
		System.out.println(keyword);
		System.out.println(keywordCheck);
		
		ModelAndView modelAndView = new ModelAndView();
		
		if(keywordCheck.equals("1")) {
			
			int endNum = pg*5;
			int startNum = endNum-4;
			
			
			ArrayList<MemberDTO> list = (ArrayList<MemberDTO>)adminService.searchName(keyword,startNum,endNum);
			
			int totalA = adminService.getTotalA();	
			int totalP = (totalA+4) / 5;				

			int startPage = (pg-1)/3*3+1;	
			int endPage = startPage + 3 - 1;
			if(totalP < endPage) endPage = totalP;
			modelAndView.addObject("keywordCheck", keywordCheck);
			modelAndView.addObject("list", list);
			modelAndView.addObject("startPage", startPage);
			modelAndView.addObject("endPage", endPage);
			modelAndView.addObject("pg",pg);
			modelAndView.addObject("totalP", totalP);
			modelAndView.addObject("tab", "admin_member.jsp");
			modelAndView.addObject("display", "adminList.jsp");
			modelAndView.setViewName("admin_main.jsp");
			
		}else if(keywordCheck.equals("2")) {
			int endNum = pg*5;
			int startNum = endNum-4;
			
			
			ArrayList<MemberDTO> list = (ArrayList<MemberDTO>)adminService.searchId(keyword, startNum, endNum);
			
			int totalA = adminService.getTotalA();	
			int totalP = (totalA+4) / 5;				

			int startPage = (pg-1)/3*3+1;	
			int endPage = startPage + 3 - 1;
			if(totalP < endPage) endPage = totalP;
			modelAndView.addObject("keywordCheck", keywordCheck);
			modelAndView.addObject("list", list);
			modelAndView.addObject("startPage", startPage);
			modelAndView.addObject("endPage", endPage);
			modelAndView.addObject("pg",pg);
			modelAndView.addObject("totalP", totalP);
			modelAndView.addObject("tab", "admin_member.jsp");
			modelAndView.addObject("display", "adminList.jsp");
			modelAndView.setViewName("admin_main.jsp");
		}
		
		return modelAndView;
	}
	
	//관리자 목록
	@RequestMapping(value="/admin/managerList")
	public ModelAndView managerList(HttpServletRequest request, ModelAndView modelAndView) {
		System.out.println("[관리자 목록 확인]");
		
		//DB 연동
		List<AdminDTO> list = adminService.adminList();
		
		//화면 전환
		modelAndView.addObject("list", list);
		modelAndView.addObject("tab", "admin_manager.jsp");
		modelAndView.addObject("display","managerList.jsp");
		modelAndView.setViewName("../admin/admin_main.jsp");
		
		return modelAndView;
	}
	
	
	
		
	   @RequestMapping(value="/admin/tab_member")
	   public ModelAndView tab_member() {
	      ModelAndView modelAndView = new ModelAndView();
	      modelAndView.addObject("tab", "admin_member.jsp");
	      modelAndView.setViewName("admin_main.jsp");
	      return modelAndView;
	   }
	   @RequestMapping(value="/admin/tab_item")
	   public ModelAndView tab_item() {
	      ModelAndView modelAndView = new ModelAndView();
	      modelAndView.addObject("tab", "admin_item.jsp");
	      modelAndView.setViewName("admin_main.jsp");
	      return modelAndView;
	   }
	   
	   @RequestMapping(value="/admin/tab_order")
	   public ModelAndView tab_order() {
	      ModelAndView modelAndView = new ModelAndView();
	      modelAndView.addObject("tab", "admin_order.jsp");
	      modelAndView.setViewName("admin_main.jsp");
	      return modelAndView;
	   }
	   @RequestMapping(value="/admin/tab_account")
	   public ModelAndView tab_account() {
	      ModelAndView modelAndView = new ModelAndView();
	      modelAndView.addObject("tab", "admin_account.jsp");
	      modelAndView.setViewName("admin_main.jsp");
	      return modelAndView;
	   }
	   @RequestMapping(value="/admin/tab_manager")
	   public ModelAndView tab_manager() {
	      ModelAndView modelAndView = new ModelAndView();
	      modelAndView.addObject("tab", "admin_manager.jsp");
	      modelAndView.setViewName("admin_main.jsp");
	      return modelAndView;
	   }
	   @RequestMapping(value="/admin/tab_board")
	   public ModelAndView tab_board() {
	      ModelAndView modelAndView = new ModelAndView();
	      modelAndView.addObject("tab", "admin_board.jsp");
	      modelAndView.setViewName("admin_main.jsp");
	      return modelAndView;
	   }
	   @RequestMapping(value="/admin/tab_home")
	   public ModelAndView tab_home() {
	      ModelAndView modelAndView = new ModelAndView();
	      modelAndView.setViewName("../main/index.html");
	      return modelAndView;
	   }

 

    public KeyPair generateKeyPair() throws NoSuchAlgorithmException {
		KeyPairGenerator generator = KeyPairGenerator.getInstance(KEY_FACTORY_ALGORITHM);
		generator.initialize(DEFAULT_KEY_SIZE, new SecureRandom());
		KeyPair pair = generator.generateKeyPair();
		return pair;
	}

	
	


	public String decrypt(String cipherText, PrivateKey privateKey) throws Exception {
			byte[] bytes = new byte[cipherText.length() / 2]; 
			for (int i = 0; i < bytes.length; i++) { 
	 			bytes[i] = (byte) Integer.parseInt(cipherText.substring(2 * i, 2 * i + 2), 16); 
 			} 
			Cipher cipher = Cipher.getInstance(KEY_FACTORY_ALGORITHM);
			System.out.println(bytes.length);
			cipher.init(Cipher.DECRYPT_MODE, privateKey);
			return new String(cipher.doFinal(bytes));
	}
	
	
	private String toSha256(String str) throws Exception {
		MessageDigest mdSHA256 = MessageDigest.getInstance("SHA-256");
        mdSHA256.update(str.toString().getBytes("UTF-8"));
        byte[] sha256Hash = mdSHA256.digest();
        StringBuilder hexSHA256hash = new StringBuilder();
        for(byte b : sha256Hash) {
            String hexString = String.format("%02x", b);
            hexSHA256hash.append(hexString);
        }        
        
        return hexSHA256hash.toString();
	}




}
