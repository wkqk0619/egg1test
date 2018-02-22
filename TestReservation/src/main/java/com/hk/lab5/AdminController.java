package com.hk.lab5;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {

	//관리자메인화면으로 이동
	@RequestMapping(value="/AdminPage.do", method=RequestMethod.GET)
	public String AdminPage() {
		return "AdminPage";
	}
	
	//구매정보 관리 페이지로 이동
	@RequestMapping(value="/buyInfo.do", method=RequestMethod.GET)
	public String buyInfo() {
		return "buyInfo";
	}
	
	//판매정보 관리 페이지로 이동
	@RequestMapping(value="/sellInfo.do", method=RequestMethod.GET)
	public String sellInfo() {
		return "sellInfo";
	}
}
