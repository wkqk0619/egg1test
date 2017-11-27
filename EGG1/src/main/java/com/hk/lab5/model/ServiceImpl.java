﻿package com.hk.lab5.model;

import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.lab5.dtos.AccountDto;
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
	public String emailSend(String email,String command) 
	{
		if(command.equals("R"))
		{
			Random random = new Random();
			String content = Long.toHexString(Math.abs(random.nextLong()));	// 이게 바로 난수
			
			String title = "이지지원에 관심을 주셔서 감사합니다.";
			
			MailSend ms = new MailSend();
			
			ms.mailSend(email, title, content);
			
			return content;
		}
		else if(command.equals("P"))
		{
			Random random = new Random();
			String content = Long.toHexString(Math.abs(random.nextLong()));	// 이게 바로 난수
			
			String title = "비밀번호 찾기 인증번호";
			
			MailSend ms = new MailSend();
			
			ms.mailSend(email, title, content);
			
			return content;
		}
		else if(command.equals("F"))
		{
			try 
			{
				MailSend ms = new MailSend();
				String title = "이지지원 계정비밀번호";
				
				String content = dao.findpw(email);
						
				ms.mailSend(email, title, content);
				
				return "S";
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
				return "F";
			}
		}
		
		return "";
	}

	@Override
	public boolean regist(String email, String pw) 
	{
		return dao.regist(email,pw);
	}

	@Override
	public AccountDto login(Map<String, String> map) 
	{
		return dao.login(map);
	}





	//질문가져오기
	@Override
	public List<QuestionDto> selectQuestion() {
		// TODO Auto-generated method stub
		return dao.selectQuestion();
	}

	
	
	//질문추가하기
	@Override
	public int InsertQuestion(String qname) {
		// TODO Auto-generated method stub
		return dao.InsertQuestion(qname);
	}


	@Override
	public List<QuestionDto> searchInfo(String qname) {
		// TODO Auto-generated method stub
		return dao.searchInfo(qname);
	}


	@Override
	public int deleteQuestion(int qseq) {
		// TODO Auto-generated method stub
		return dao.deleteQuestion(qseq);
	}


	@Override
	public List<NotionDto> selectNotion() {
		// TODO Auto-generated method stub
		return dao.selectNotion();
	}


	@Override
	public NotionDto ajaxNotionDetail(String nseq) {
		// TODO Auto-generated method stub
		return dao.ajaxNotionDetail(nseq);
	}


	@Override
	public int delNot(int nseq) {
		// TODO Auto-generated method stub
		return dao.delNot(nseq);
	}


	@Override
	public int insertNot(NotionDto dto) {
		// TODO Auto-generated method stub
		return dao.insertNot(dto);
	}


	@Override
	public int updateNot(NotionDto dto) {
		// TODO Auto-generated method stub
		return dao.updateNot(dto);
	}

}




