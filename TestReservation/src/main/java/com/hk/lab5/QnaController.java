package com.hk.lab5;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class QnaController {
	
	
	@RequestMapping(value="/QnaBoard.do", method=RequestMethod.GET)
	public String QnaBoard()
	{
		return "QnaBoard";
	}

}
