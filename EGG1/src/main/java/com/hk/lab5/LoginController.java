package com.hk.lab5;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.lab5.dtos.AccountDto;
import com.hk.lab5.model.IService;

@Controller
public class LoginController 
{
	@Autowired
	private IService iservice;
	
	@RequestMapping(value="/Main.do", method=RequestMethod.GET)
	public String usermain()
	{
		return "index";
	}
	@RequestMapping(value="/AdminMain.do", method=RequestMethod.GET)
	public String adminmain()
	{
		return "adminindex";
	}
	
	@RequestMapping(value="/LoginMain.do", method=RequestMethod.GET)
	public String userLoginMain()
	{
		return "main";
	}
	
	@RequestMapping(value="/AdminLoginMain.do", method=RequestMethod.GET)
	public String AdminLoginMain()
	{
		return "adminmain";
	}
	
	
	
	// 가입할때 이메일에 인증메일 보냄
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
			return iservice.emailSend(email,"R");
		}
	}
	
	// 가입
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
	
	// 비밀번호 찾을때 인증메일 보냄
	@RequestMapping(value="/FindCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public String find(String email)
	{
		// 아이디 존재확인 true = 이미 존재함 false = 없음
		if(iservice.emailChk(email))
		{
			return iservice.emailSend(email,"P");
		}
		else
		{
			return "O";
		}
	}
	
	// 메일로 비밀번호 전송
	@RequestMapping(value="/Sendpw.do", method=RequestMethod.POST)
	@ResponseBody
	public String sendpw(String email)
	{
		return iservice.emailSend(email, "F");
	}
	
	@RequestMapping(value="/Login.do", method=RequestMethod.POST)
	@ResponseBody
	public String login(String id,String pw, HttpSession session)
	{
		Map<String, String>map = new HashMap<String,String>();
		map.put("id", id);
		map.put("pw", pw);
		
		AccountDto ldto = iservice.login(map);
		
		if(ldto==null)
		{
			return "F";
		}
		else
		{
			session.setAttribute("ldto", ldto);
			return "S";
		}
		
	}
	
	
}
