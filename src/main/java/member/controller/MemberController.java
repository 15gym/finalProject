package member.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
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

import javax.servlet.http.Cookie;

import javax.crypto.Cipher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import admin.controller.AdminService;
import member.bean.MemberDTO;
import member.dao.MemberDAO;
import order.controller.OrderlistController;






@Controller
public class MemberController {
	private static final String SIGN_KEY = "ca2ke_n4icf";
	
	private static final int DEFAULT_KEY_SIZE = 2048;

	private static final String KEY_FACTORY_ALGORITHM = "RSA";
	
	@Autowired
	MemberService memberService;
	@Autowired
	AdminService adminService;
    @Autowired
    OrderlistController orderController;
    @Autowired
    MemberDAO dao;
    
    
    
    @RequestMapping(value="/main/myPage")
    public ModelAndView myPage(HttpServletRequest request) {
        ModelAndView modelAndView = new ModelAndView();
        
        modelAndView = orderController.myOrder(request, modelAndView);
        return modelAndView;
    }
	

	@RequestMapping(value="/main/joinForm")
	public ModelAndView memberJoinForm(HttpServletRequest request, HttpSession session) throws Exception {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
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
		modelAndView.addObject("display2", "../member/joinForm.jsp");
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
	}
	
	
	@RequestMapping("/main/joinCheckId")
	@ResponseBody
    public Map<Object, Object> idcheck(@RequestBody String m_id) {
	     
        Map<Object, Object> map = new HashMap<Object, Object>();
        
        boolean exist = memberService.isExisId(m_id);
        map.put("exist", exist);
        
        return map;
    }
	@RequestMapping(value="/main/join")
	public ModelAndView joinOk(HttpServletRequest request, HttpSession session) throws Exception {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		PrivateKey privateKey = (PrivateKey)session.getAttribute("_RSA_WEB_Key_");
		session.removeAttribute("_RSA_WEB_Key_");
		
		String pwd = request.getParameter("m_pwd");
		String m_id = request.getParameter("m_id");
		String m_pwd = decrypt(pwd, privateKey);
		m_pwd += SIGN_KEY;
		m_pwd = toSha256(m_pwd);
        System.out.println("final hashed:::::::::::\n" + m_pwd);
		
		String m_name = request.getParameter("m_name");
		String m_phone = request.getParameter("m_phone");
		String m_email = request.getParameter("m_email");
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setM_id(m_id);
		memberDTO.setM_pwd(m_pwd);
		memberDTO.setM_name(m_name);
		memberDTO.setM_phone(m_phone);
		memberDTO.setM_email(m_email);
		
		int result = 0;
		result = memberService.join(memberDTO);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.addObject("result", result);
		modelAndView.addObject("display", "../member/join.jsp");
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
	}
	@RequestMapping(value="/main/loginForm")
	public ModelAndView loginForm(HttpSession session) throws Exception {
		System.out.println("start loginForm");
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
		modelAndView.addObject("display2", "../member/loginForm.jsp");
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
	}
	@RequestMapping(value="/main/login")
	public ModelAndView login(HttpServletRequest request, HttpSession session) throws Exception {
		System.out.println("start login");
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PrivateKey privateKey = (PrivateKey)session.getAttribute("_RSA_WEB_Key_");
		session.removeAttribute("_RSA_WEB_Key_");
		String id = request.getParameter("m_id");
		String pwd = request.getParameter("m_pwd");
		System.out.println("id :::::::::::::::::::::::"+id);
		System.out.println("pwd :::::::::::::::::::::::"+pwd);
		id = decrypt(id, privateKey);
		pwd = decrypt(pwd, privateKey);
		System.out.println(id);
		System.out.println(pwd);
		String m_name = "";
		
		
		pwd += SIGN_KEY;
		pwd = toSha256(pwd);
        System.out.println("final hashed:::::::::::\n" + pwd);

		ModelAndView modelAndView = new ModelAndView();
		
		if(id.contains("admin")) {
			m_name = adminService.adminLogin(id, pwd);
			if(m_name == null) {
				modelAndView.setViewName("adminlogin");
			}else {
				session.setAttribute("admin", id);
				session.setAttribute("memId", id);
				session.setAttribute("memName", m_name);
				modelAndView.setViewName("adminlogin");
			}
			
		}else {
			m_name = memberService.login(id, pwd);
			if(m_name == null) {
				modelAndView.setViewName("../member/login.jsp");
			}else {
				
				//세션 지우기 (관리자 로그인 상태에서 회원으로 로그인할 경우 관리자 세션 삭제)
                if (session.getAttribute("admin") != null) {
                    session.removeAttribute("admin");
                }
				
				session.setAttribute("memId", id);
				session.setAttribute("memName", m_name);
				modelAndView.setViewName("../member/login.jsp");
			}
		}
		
		Thread.sleep(200); // 해시값 무작위 대입을 통한 비밀번호 해킹을 방지하기 위함. 
		return modelAndView;
	}
	
	
	// 회원정보만 보여주는 폼 여기서 회원탈퇴및 회원정보수정 버튼을 클릭해서 움직일수있음.
	@RequestMapping(value="/main/modifyViewForm")
	public ModelAndView modifyViewForm(HttpServletRequest request) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		String memId = (String) session.getAttribute("memId");
		MemberDTO memberDTO = memberService.modifyView(memId);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.addObject("display", "../member/modifyViewForm.jsp");
		modelAndView.setViewName("../member/myPage.jsp");
		return modelAndView;
	}
	@RequestMapping(value="/main/modifyEditCheckForm")
	public ModelAndView modifyEditCheckForm(HttpSession session, HttpServletRequest request) throws Exception {
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
		modelAndView.setViewName("../member/modifyEditCheckForm.jsp");
		return modelAndView;
		
	}
	// 회원정보수정 들어가기전에 비밀번호 폼만 만들어서 DTO에 있는 비밀번호와  텍스트비밀번호가 일치하는지 확인
	@RequestMapping(value="/main/modifyEditCheck")
	public ModelAndView modifyEditCheck(HttpSession session, HttpServletRequest request) throws Exception {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		PrivateKey privateKey = (PrivateKey)session.getAttribute("_RSA_WEB_Key_");
		session.removeAttribute("_RSA_WEB_Key_");
		String pwd = request.getParameter("m_pwd");
		System.out.println("pwd :::::::::::::::::::::::"+pwd);
		pwd = decrypt(pwd, privateKey);
		System.out.println(pwd);
		String m_name = "";
		
		
		pwd += SIGN_KEY;
		pwd = toSha256(pwd);
        	System.out.println("final hashed:::::::::::\n" + pwd);

		String m_pwd = pwd;
		String m_id =  (String) session.getAttribute("memId");
		String memPwd = memberService.pwdCheck(m_id);
		
		
		
		ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("m_pwd", m_pwd);
			modelAndView.addObject("memPwd", memPwd);
			modelAndView.setViewName("../member/modifyEditCheck.jsp");

		return modelAndView;
	}
	
	@RequestMapping(value="/main/modifyForm")
	public ModelAndView modifyForm(HttpServletRequest request) throws Exception {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
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
		String memId = (String) session.getAttribute("memId");
		MemberDTO memberDTO = memberService.modifyView(memId);
		modelAndView.addObject("memberDTO", memberDTO);
		modelAndView.addObject("display", "../member/modifyForm.jsp");
		modelAndView.setViewName("../member/myPage.jsp");
		return modelAndView;

	}
	@RequestMapping(value="/main/modify")
	public ModelAndView modify(HttpServletRequest request) throws Exception {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession session = request.getSession();
		PrivateKey privateKey = (PrivateKey)session.getAttribute("_RSA_WEB_Key_");
		session.removeAttribute("_RSA_WEB_Key_");
		String pwd = request.getParameter("m_pwd");
		System.out.println("pwd :::::::::::::::::::::::"+pwd);
		pwd = decrypt(pwd, privateKey);
		System.out.println(pwd);
		
		pwd += SIGN_KEY;
		pwd = toSha256(pwd);
        	System.out.println("final hashed:::::::::::\n" + pwd);

		String m_id = request.getParameter("m_id");
		String m_pwd = pwd;
		String m_name = request.getParameter("m_name");
		String m_phone = request.getParameter("m_phone");
		String m_email = request.getParameter("m_email");
		
		MemberDTO memberDTO = new MemberDTO();
		
		memberDTO.setM_id(m_id);
		memberDTO.setM_pwd(m_pwd);
		memberDTO.setM_name(m_name);
		memberDTO.setM_phone(m_phone);
		memberDTO.setM_email(m_email);
		
		int result = 0;
		result = memberService.modifyUpdate(memberDTO);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("result", result);
		modelAndView.setViewName("../member/modify.jsp");
		return modelAndView;
	}
	@RequestMapping(value="/main/modifyEditOklogout")
	public ModelAndView modifyEditOklogout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.removeAttribute("memName");
		session.removeAttribute("memId");
		session.removeAttribute("memPwd");
		
		session.invalidate();	// 무효화 : 모두 지우기
		
		//쿠키 정보 모두 삭제
        Cookie[] cookies = request.getCookies(); // 요청정보로부터 쿠키를 가져온다.
        if (cookies!=null) {
            for(int i = 0 ; i<cookies.length; i++){         // 쿠키 배열을 반복문으로 돌린다.
                //System.out.println(cookies[i].getName());
                cookies[i].setValue("");
                cookies[i].setPath("/");
                cookies[i].setMaxAge(0);  		  	// 특정 쿠키를 더 이상 사용하지 못하게 하기 위해서는 쿠키의 유효시간을 만료시킨다.
                response.addCookie(cookies[i]);   // 해당 쿠키를 응답에 추가(수정)한다.
            }
        }
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("../member/modifyEditOklogout.jsp");
		return modelAndView;
	}
	
	
	@RequestMapping(value="/main/logOut")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.removeAttribute("memName");
		session.removeAttribute("memId");
		session.removeAttribute("memPwd");
		
		session.invalidate();	// 무효화 : 모두 지우기
		
		//쿠키 정보 모두 삭제
        Cookie[] cookies = request.getCookies(); // 요청정보로부터 쿠키를 가져온다.
        if (cookies!=null) {
            for(int i = 0 ; i<cookies.length; i++){         // 쿠키 배열을 반복문으로 돌린다.
                //System.out.println(cookies[i].getName());
                cookies[i].setValue("");
                cookies[i].setPath("/");
                cookies[i].setMaxAge(0);
                // 특정 쿠키를 더 이상 사용하지 못하게 하기 위해서는 쿠키의 유효시간을 만료시킨다.
                response.addCookie(cookies[i]);             // 해당 쿠키를 응답에 추가(수정)한다.
            }
        }
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("../member/logOut.jsp");
		return modelAndView;
	}
	@RequestMapping(value="/main/deleteForm")
	public ModelAndView deleteForm(HttpServletRequest request, HttpSession session) throws Exception {
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
		modelAndView.setViewName("../member/deleteForm.jsp");
		return modelAndView;
	}

	//탈퇴
	@RequestMapping(value="/main/delete")
    public ModelAndView delete(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception {
	PrivateKey privateKey = (PrivateKey)session.getAttribute("_RSA_WEB_Key_");
	session.removeAttribute("_RSA_WEB_Key_");
	
	String pwd = request.getParameter("m_pwd");
        System.out.println("전송한 비밀번호: "+pwd);
	String m_pwd = decrypt(pwd, privateKey);
	m_pwd += SIGN_KEY;
	m_pwd = toSha256(m_pwd);
		
	System.out.println("[회원 탈퇴]");
        System.out.println("입력한 비밀번호: "+m_pwd);
        
        //세션에서 아이디 추출
        String m_id = null;
        if (session.getAttribute("memId")!=null) {
            m_id = (String) session.getAttribute("memId");
        };
                
        String password= memberService.pwdCheck(m_id);
        int result = 0;
        if (m_pwd.equals(password)) { //올바른 비밀번호를 입력한 경우만 탈퇴
            result = memberService.memberDelete(m_id);
        }
        
        //탈퇴 성공한 경우 세션 삭제
        if (result==1) {
 
            session.removeAttribute("memName");
            session.removeAttribute("memId");
            session.removeAttribute("memPwd");
            
            session.invalidate();   // 무효화 : 모두 지우기
        }
        
        //쿠키 정보 모두 삭제
        Cookie[] cookies = request.getCookies(); // 요청정보로부터 쿠키를 가져온다.
        if (cookies!=null) {
            for(int i = 0 ; i<cookies.length; i++){         // 쿠키 배열을 반복문으로 돌린다.
                //System.out.println(cookies[i].getName());
                cookies[i].setValue("");
                cookies[i].setPath("/");
                cookies[i].setMaxAge(0);
                // 특정 쿠키를 더 이상 사용하지 못하게 하기 위해서는 쿠키의 유효시간을 만료시킨다.
                response.addCookie(cookies[i]);             // 해당 쿠키를 응답에 추가(수정)한다.
            }
        }
        
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("result", result);
        modelAndView.setViewName("../member/delete.jsp");
        return modelAndView;
    }

	
	// 회원가입 이메일 인증
	@RequestMapping(value = "/main/authSend" , method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public @ResponseBody Map<Object, Object> checkDuplicate(HttpServletResponse response,  @RequestParam("m_email") String m_email, Model model)throws Exception {

		URLEncoder.encode(m_email, "UTF-8");
		System.out.println(m_email);
		boolean result = memberService.emailCheck(m_email);
		System.out.println(result);
		
		Map<Object, Object> map = new HashMap<Object, Object>();
		String authNum = "";

		EmailSend emailSend = new EmailSend();
		authNum = emailSend.RandomNum();
		System.out.println(authNum);
		String content = "인증번호 [" + authNum + "]";
		
		map.put("result", result);
		map.put("authNum", authNum);
		
		if (result == false) {
		emailSend.sendmail(m_email, authNum,content);
		}
			
		return map;
	}
	@RequestMapping(value="/main/emailCheckForm")
	public ModelAndView emailCheckForm(HttpServletRequest request) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("../member/emailCheckForm.jsp");
		return modelAndView;
	}
    @RequestMapping(value="/main/findIdForm")
	public ModelAndView findIdFindForm(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display2", "../member/findIdForm.jsp");
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
	}

    
    @RequestMapping(value="/main/findId")
	public ModelAndView findIdFind(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	String m_email = request.getParameter("m_email");
    	String m_name = request.getParameter("m_name");

    	ModelAndView modelAndView = new ModelAndView();
    	
    	// authNum << 아이디찾기 에서 아이디값 받아온다 .. email메소드 재활용하기위해서 이렇게함..
    	String authNum = memberService.idFind(m_name, m_email);
    	
    	if(authNum != null) {
    		EmailSend emailSend = new EmailSend();
    		String content = m_name +"님의 아이디는  = [" + authNum + "]입니다.";
    		emailSend.sendmail(m_email, authNum,content);
    		modelAndView.addObject("authNum", authNum);
			modelAndView.setViewName("../member/findId.jsp");
    	}else {
    		modelAndView.addObject("authNum", authNum);
			modelAndView.setViewName("../member/findId.jsp");
    	}

		return modelAndView;
	}
    
    @RequestMapping(value="/main/findPwForm")
	public ModelAndView findPwFindForm(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("display2", "../member/findPwForm.jsp");
		modelAndView.setViewName("../main/main.jsp");
		return modelAndView;
	}
    @RequestMapping(value="/main/findPw")
  	public ModelAndView findPwFind(HttpServletRequest request, HttpServletResponse response) throws Exception {
      	String m_email = request.getParameter("m_email");
      	String m_id = request.getParameter("m_id");
      	ModelAndView modelAndView = new ModelAndView();
      	
      	
      	// authNum << 아이디찾기 에서 비밀번호받아온다 .. email메소드 재활용하기위해서 이렇게함..
      	String authNum = memberService.pwFind(m_id, m_email);
      	
      	if(authNum != null) {
      		EmailSend emailSend = new EmailSend();
      		
      		StringBuffer temp = new StringBuffer();
      		Random rnd = new Random();
      		for (int i = 0; i < 8; i++) {
      		    int rIndex = rnd.nextInt(3);
      		    switch (rIndex) {
      		    case 0:
      		        // a-z
      		        temp.append((char) ((int) (rnd.nextInt(26)) + 97));
      		        break;
      		    case 1:
      		        // A-Z
      		        temp.append((char) ((int) (rnd.nextInt(26)) + 65));
      		        break;
      		    case 2:
      		        // 0-9
      		        temp.append((rnd.nextInt(10)));
      		        break;
      		    }
      		}
      		String content = "회원님의 임시 비밀번호는  = [" + temp.toString() + "]입니다.";
      		emailSend.sendmail(m_email, temp.toString() ,content);
      		MemberDTO memberDTO = new MemberDTO();
      		
      		
      		
    		
    		
            String m_pwd = toSha256(temp.toString());
            System.out.println("hashed:::::::::::\n" + m_pwd);
            m_pwd += SIGN_KEY;
            m_pwd = toSha256(m_pwd);
            System.out.println("final hashed:::::::::::\n" + m_pwd);
      		
            
            
            
            
            
            
            
            memberDTO.setM_id(m_id);
      		memberDTO.setM_pwd(m_pwd);
      		dao.changePwd(memberDTO);
      		modelAndView.addObject("authNum", authNum);
			modelAndView.setViewName("../member/findPw.jsp");
    	}else {
    		modelAndView.addObject("authNum", authNum);
			modelAndView.setViewName("../member/findId.jsp");
    	}
  		
  		
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
