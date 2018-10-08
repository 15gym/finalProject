package member.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.omg.DynamicAny.NameValuePair;

import com.fasterxml.jackson.databind.JsonNode;

public class EmailSend {
	public void sendmail(String email, String authNum, String content) throws Exception {
		String  host = "smtp.gmail.com";
		String subject = "ca2ke 인증번호 전달";
		String fromName = "ca2ke 이현호관리자 전달";
		String from = "leehh312@gmail.com";
		String to1 = email;
		
		
		
		Properties props = new Properties();
		
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.transport.protocol", "smtp");
		props.put("mail.smtp.host", host);
		props.setProperty("mail.smtp.socketFactoty.class", "javax.net.ssl.SSLSocketFactory");
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.user", from);
		props.put("mail.smtp.auth", "true");
		
		Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("leehh312", "tkfkd0529");
			}
		});
		Message msg = new MimeMessage(mailSession);
		msg.setFrom(new InternetAddress(from, MimeUtility.encodeText(fromName, "UTF-8", "B")));
		
		InternetAddress[] address1 = {new InternetAddress(to1) };
		msg.setRecipients(Message.RecipientType.TO, address1);
		msg.setSubject(subject);
		msg.setSentDate(new java.util.Date());
		msg.setContent(content, "text/html; charset=euc-kr");
		
		
		Transport.send(msg);
	}
	
	public String RandomNum() {
		StringBuffer buffer = new StringBuffer();
		for(int i =0; i <= 6; i++) {
			int n=(int)(Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	
}
