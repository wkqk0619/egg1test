package com.hk.lab5;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.lab5.dtos.AccountDto;
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
	
	@RequestMapping(value="/combineSearch.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, List> combineSearch(HttpSession session,String search)
	{
		AccountDto ldto = (AccountDto)session.getAttribute("ldto");
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("id", ldto.getId());
		
		return iservice.combineSearch(map);
	}
	
}
