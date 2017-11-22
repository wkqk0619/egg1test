package com.hk.lab5;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.lab5.model.IService;

@Controller
public class LoginController 
{
	@Autowired
	private IService iservice;
	
	@RequestMapping(value="/EmailCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public String regist(String email)
	{
		// 아이디 중복검사 true = 이미 존재함 false = 없음
		if(iservice.emailChk(email))
		{
			return "O";
		}
		else
		{
			String str = iservice.emailSend(email);
			
			return str;
		}
	}
	
	@RequestMapping(value="/Regist.do", method=RequestMethod.POST)
	@ResponseBody
	public String regist(String email,String pw)
	{
		if(iservice.regist(email,pw))
		{
			return "S";
		}
		else
		{
			return "F";
		}
	}
	
}
