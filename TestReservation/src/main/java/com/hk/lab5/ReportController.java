package com.hk.lab5;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReportController {

	//신고게시판으로 이동
	@RequestMapping(value="/reportBoard.do", method=RequestMethod.GET)
	public String reportBoard() 
	{
		return "reportBoard";
	}
}
