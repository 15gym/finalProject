package member.controller;

import java.util.List;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.HttpURLConnection;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

import category.bean.CategoryDTO;
import category.dao.CategoryDAO;

@Controller
public class KakaoController2 {

	@RequestMapping(value="/kakaoCallback")
	public ModelAndView navLogin(HttpServletRequest request) throws Exception {
		  	String clientId = "lmCBeDlP2a554rAl3fWq";
			String clientSecret = "0X65Ys8mgK";
			String code = request.getParameter("code");
			String state = request.getParameter("state");
			String redirectURI = URLEncoder.encode("http://localhost:8080/ca2ke/naverCallback", "utf-8");
			String apiURL;
			apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&;";
			apiURL += "client_id=" + clientId;
			apiURL += "&client_secret=" + clientSecret;
			apiURL += "&redirect_uri=" + redirectURI;
			apiURL += "&code=" + code;
			apiURL += "&state=" + state;
			String access_token = "";
			String refresh_token = "";
			
			StringBuffer res = new StringBuffer();
			try {
				URL url = new URL(apiURL);
				HttpURLConnection con = (HttpURLConnection)url.openConnection();
				con.setRequestMethod("GET");
				int responseCode = con.getResponseCode();
				BufferedReader br;
				if(responseCode == 200) {
					br = new BufferedReader(new InputStreamReader(con.getInputStream()));
				} else {
					br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
				}
				String inputLine;
				while((inputLine = br.readLine()) != null) {
					res.append(inputLine);
				}
				br.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			String jsonStr = String.valueOf(res);
			String acToken = "";
			try {
				JSONParser jsonParser = new JSONParser();
				JSONObject jsonObj = (JSONObject) jsonParser.parse(jsonStr);
				acToken = (String)jsonObj.get("access_token");
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			
		
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("token", acToken);
			modelAndView.setViewName("main/index.html");
			return modelAndView;
	}	
	/*@RequestMapping(value="/personalInfo")
	public ModelAndView personalInfo(HttpServletRequest request) throws Exception {
		String token = (String)request.getAttribute("token");
		String header = "Bearer" + " " + token;
		StringBuffer response = new StringBuffer();
		try {
			String apiURL = "https://openapi.naver.com/v1/nid/me";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("Authorization", header);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if(responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			while((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			System.out.println(response.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		ModelAndView modelAndView = new ModelAndView();
		
			String jsonStr = String.valueOf(response);
			try {
				JSONParser jsonParser = new JSONParser();
				JSONObject jsonObj1 = (JSONObject) jsonParser.parse(jsonStr);
				String jsonStr2 = String.valueOf(jsonObj1.get("response"));
				JSONObject jsonObj2 = (JSONObject) jsonParser.parse(jsonStr2);
				System.out.println((String)jsonObj2.get("id"));
				System.out.println((String)jsonObj2.get("age"));
				System.out.println((String)jsonObj2.get("gender"));
				System.out.println((String)jsonObj2.get("email"));
				System.out.println((String)jsonObj2.get("name"));
				System.out.println((String)jsonObj2.get("birthday"));
			} catch (ParseException e) {
				e.printStackTrace();
			}
		
		
		
		modelAndView.setViewName("main/index.html");
		return modelAndView;
	}*/
}
