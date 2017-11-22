package com.hk.lab5.model;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.lab5.mail.MailSend;

@Service
public class ServiceImpl implements IService {

	@Autowired
	private IDao dao;

	// 아이디 중복검사 true = 이미 존재함 false = 없음
	@Override
	public boolean emailChk(String email) 
	{
		int count = dao.emailChk(email);
		
		return count>0?true:false;
	}

	@Override
	public String emailSend(String email) 
	{
		Random random = new Random();
		String content = Long.toHexString(Math.abs(random.nextLong()));	// 이게 바로 난수
		
		String title = "이지지원에 관심을 주셔서 감사합니다.";
		
		MailSend ms = new MailSend();
		
		ms.mailSend(email, title, content);
		
		return content;
	}

	@Override
	public boolean regist(String email, String pw) 
	{
		return dao.regist(email,pw);
	}

}




