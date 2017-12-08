package com.hk.lab5;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.lab5.dtos.QuestionDto;
import com.hk.lab5.model.IService;

@Controller
public class SearchInfoController {

	
	@Autowired
	private IService iservice;
	
	@RequestMapping(value="/searchInfo.do",method=RequestMethod.GET)
	public String serchInfo(Model model,String question) {
		List<QuestionDto> selists = iservice.searchInfo(question);
		System.out.println(selists);
		model.addAttribute("searInfo", selists);
		return "questionBoard";
	}
}
