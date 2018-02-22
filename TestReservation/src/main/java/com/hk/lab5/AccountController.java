package com.hk.lab5;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AccountController {
	
	@Resource(name="uploadPath")
	   String uploadPath;
	
	@RequestMapping(value="/LoginPage.do", method=RequestMethod.GET)
	public String LoginPage() {
		return "LoginPage";
	}
	
	@RequestMapping(value="/userLogin.do", method=RequestMethod.POST)
	public String userLogin(String email, String password, HttpSession session) {
		Map<String, String>map = new HashMap<String,String>();
		map.put("email", email);
		map.put("password", password);
		session.setAttribute("ldto", map);
		return "userMain";
	}
	
	
	@RequestMapping(value="/userLogout.do", method=RequestMethod.GET)
	public String userLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/LoginPage.do";
	}

}
