package com.hk.lab5.model;

import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hk.lab5.dtos.AccountDto;
import com.hk.lab5.mail.MailSend;

@Service
public class ServiceImpl implements IService {

	@Autowired
	private IDao dao;

	/*
	 * 서비스쪽에서 여러개의 dao 메소드를 호출하니 하나의 dao 메소드는 하나의 쿼리문을 날린다
	 * 트랜잭션은 서비스쪽에서 건다.
	 * @Transactional 트랜잭션 걸기
	 * @Transactional(readOnly=true) : select일 경우(비동기식으로 처리 수정중이건 뭐건 현재의 값을 가져옴)
	 */
	
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

}




