package com.hk.lab5.mail;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailSend
{
	/**
	 * 메일을 보내는 메소드
	 * (보낼이메일, 제목, 내용)
	 */
	public void mailSend(String email, String title, String content)
	{
		//java.util.Properties smtp 서버와 연결하기 위한 환경설정
		//사용하기 원하는 메일서버, 통신방법에 따라 
		//소소하게 설정이 바뀐다.
		Properties prop = new Properties();
		
		// 프로토콜 설정 smtp를 예로 들었지만 다른 방식을 사용하고 싶으면 "smtp" 를 원하는 방식으로 바꿔주면 된다.
		prop.put("mail.transport.protocol", "smtp");
		
		//SMTP 주소 => google 사용하였기 때문에 "smtp.gmail.com" 
		//이 역시 다른 메일서버를 사용하면 그에 따라 "smtp.gmail.com" => 교체해주면 된다.
		prop.put("mail.smtp.host", "smtp.daum.net");// gmail SMTP 서비스 주소(호스트)
		
		//SMTP port number  메일서버마다 포트번호가 다르기 때문에 확인하고 번호 수정을 해주면된다.
		prop.put("mail.smtp.port", "465");// gmail SMTP 서비스 포트 설정
		
		//"mail.smtp.starttls.enable","true" => 이거 안하면 이메일 인증 시도조차 하지 않는다.
		prop.put("mail.smtp.starttls.enable","true");
		
		
		// gmail 인증용 Secure Socket Layer(SSL) 설정
		prop.setProperty("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		
		//"mail.smtp.auth", "true" => 이것역시 안하면 이메일 인증 하지 않는다.
		prop.put("mail.smtp.auth", "true");// SMTP 인증을 설정

		//SMTPAuthenticator 클래스에 작성한 admin email 계정을 가지고 있는 객체 생성
		Authenticator auth = new SMTPAuthenticator();
		 
		//Session.getDefaultInstance(prop, auth)
		//=> 지금까지의 smtp 설정과 계정객체를 가지는 
		//javax.mail.Session  session 객체 생성
		Session mailSession = Session.getDefaultInstance(prop, auth);
		
		//admin 계정으로 이메일을 보낼 준비 
		MimeMessage message = new MimeMessage(mailSession);

		try 
		{
			//보내는 사람 메일
			InternetAddress from = new InternetAddress("egg1@egg1.site");
			//보내는사람 : dbdudrjs10@gmail.com
			message.setFrom(from); 
			
			//받는사람 : email
			//index.jsp 에서 인증받기 원하는 사람의 email 주소.
			message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
			
			//제목 : mail subject
			message.setSubject(title); //메일의 제목을 작성하는 부분
			
			//내용 : 메일의 내용
			message.setContent(content,"text/html; charset=utf-8"); //보내고 싶은 내용작성
			//plain
			
			
			message.setSentDate(new Date());//시간
			
			/*
			 현재상태
			 보내는사람 : dbdudrjs10@gmail.com
			 받는사람 : email
			 제목 : mail subject
			 내용 : 메일의 내용
			 시간 : 시간..
			 */
			
			Transport.send(message); //준비된 메일을 보낸다.
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}			
		
	}
}
