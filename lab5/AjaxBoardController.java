package com.hk.lab5;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.lab5.dtos.AnswerBoardDto;
import com.hk.lab5.model.IService;

@Controller
public class AjaxBoardController {
	
	@Autowired
	private IService iservice;
	
	@RequestMapping(value="/ajaxDetail.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, AnswerBoardDto> ajaxDetail(String seq){
		AnswerBoardDto dto= iservice.ajaxDetail(seq);
		Map<String, AnswerBoardDto> map = new HashMap<String, AnswerBoardDto>();
		map.put("dto", dto);
		return map;
	}
	
}










