package member.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JsonNode;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

@Controller
public class KakaoContorller {
	@Autowired
	MemberDAO dao;
	
	@Autowired
	MemberService memberservice;
	
	@RequestMapping(value="/member/kakaLogin", produces="application/json", method= {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView kakaoLogin(@RequestParam("code")String code, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws UnsupportedEncodingException {
		
		/* System.out.println("test1");
		 System.out.println("code" + code);*/
			
		 JsonNode token = KakaoLogin.getAccessToken(code);
			
		/* System.out.println("test2");
		
		 System.out.println("테스트 = " + token.get("access_token"));
		 
		 System.out.println("token.path(\"access_token\").toString()"+ token.path("access_token").toString());*/
		 
		 JsonNode profile = KakaoLogin.getKakaoMemberInfo(token.path("access_token").toString());
		
		 
		 System.out.println(profile);
	
		 ModelAndView modelAndView = new ModelAndView();
		 String sns_id = profile.path("id").asText();
		 String m_email = "";
		 String m_name = "";

		  
		 
		 JsonNode kakao_account = profile.path("kakao_account");
		 
	/*	 System.out.println(kakao_account.has("email"));*/
		 
		 if(kakao_account.has("email")) {
			 m_email= kakao_account.path("email").asText();
			}else {
				System.out.println("이메일거부");
			}
		 
			JsonNode properties = profile.path("properties");
			if(properties.has("nickname"))
				m_name = properties.path("nickname").asText();
		 
		/*	 System.out.println("m_name = " + m_name);
			 System.out.println("m_email = " + m_email);
			 System.out.println(sns_id);*/
			
		 boolean result = dao.emailCheck(m_email);
			if(result) {
				String m_id = dao.idFind(m_name, m_email);
				session.setAttribute("memId", m_id);
				session.setAttribute("memName", m_name);
				modelAndView.setViewName("login.jsp");
			} else {
				modelAndView.addObject("m_name", m_name);
				modelAndView.addObject("m_email", m_email);
				modelAndView.addObject("sns_id", sns_id);
				modelAndView.setViewName("snsJoin.jsp");
			}	
			
		return modelAndView;
	}
}
