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
	
	
	//구매자 본인이 작성한 퀘스트 리스트
	@RequestMapping(value="/TimeQuestList.do", method=RequestMethod.GET)
	public String TimeQuestList() 
	{
		return "TimeQuestList";
	}
	
	//판매자 본인이 받게될 퀘스트 결과 금액
	@RequestMapping(value="/questResult.do", method=RequestMethod.GET)
	public String questResult() 
	{
		return "questResult";
	}

}
