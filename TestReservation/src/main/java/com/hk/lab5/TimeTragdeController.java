package com.hk.lab5;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

// 시간 거래소 관련 컨트롤러
@Controller
public class TimeTragdeController {
	
	//시간거래소 
	@RequestMapping(value="/TimeTragdeBoard.do", method=RequestMethod.GET)
	public String TimeTragdeBoard() 
	{
		return "TimeTragdeBoard";
	}

}
