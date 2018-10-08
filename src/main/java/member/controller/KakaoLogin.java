package member.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;


import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import member.bean.MemberDTO;

public class KakaoLogin {
	public static JsonNode getAccessToken(String code) throws UnsupportedEncodingException {
		final String RequestUrl = "https://kauth.kakao.com/oauth/token";
		
		/*String redirect_uri = URLEncoder.encode("http://localhost:8080/ca2ke/member/kakaLogin", "utf-8");*/
		
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postParams.add(new BasicNameValuePair("client_id", "02f6761717ff9cd1a40e5d18441aed2e"));
		postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:8080/ca2ke/member/kakaLogin"));
		postParams.add(new BasicNameValuePair("code", code));
		System.out.println("new BasicNameValuePair(\"grant_type\", \"authorization_code\") = "
		+ new BasicNameValuePair("grant_type", "authorization_code"));
		final HttpClient client = HttpClientBuilder.create().build();
		System.out.println("client = " + client);
		final HttpPost post  = new HttpPost(RequestUrl);
		System.out.println("post = " + post);
		JsonNode returnNode = null;
		
		try {
			post.setEntity(new UrlEncodedFormEntity(postParams));
			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();
			
			System.out.println("\nSending 'POST' request to URL :" + RequestUrl);
			System.out.println("Post parameters :" + postParams);
			System.out.println("Response Code : " + responseCode);
			
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
			
			System.out.println("returnNode = " + returnNode);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			
		}
		
		
		return returnNode;
	}
	
	public static JsonNode getKakaoMemberInfo(String autorize_code) {
		final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
		
		
		
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
		
		post.addHeader("Authorization", "Bearer " + autorize_code);
		
		JsonNode returnNode = null;
		
		try {
			final HttpResponse response = client.execute(post);
			final int responseCode = response.getStatusLine().getStatusCode();
			
			System.out.println("\nSending 'POST' request to URL :" + RequestUrl);
			System.out.println("Response Code : " + responseCode);
			
			ObjectMapper mapper =  new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
			
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return returnNode;
	}

	
}
