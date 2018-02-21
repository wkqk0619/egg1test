package com.hk.lab5;

import javax.annotation.Resource;

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

}
