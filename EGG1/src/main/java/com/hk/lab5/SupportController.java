package com.hk.lab5;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.lab5.dtos.QuestionDto;
import com.hk.lab5.dtos.SupportDto;
import com.hk.lab5.model.IService;

@Controller
public class SupportController 
{
	@Autowired
	private IService iservice;
	
	@RequestMapping(value="/supportList.do", method=RequestMethod.GET)
	public String supportList(Model model)
	{
		List<SupportDto> list = iservice.supportList();
		model.addAttribute("list", list);
		
		return "supportBoard";
	}
	
	@RequestMapping(value="/supportQus.do", method=RequestMethod.GET)
	public String supportQus(Model model,String sseq)
	{
		List<QuestionDto> qList = iservice.selectQuestion();
		List<QuestionDto> list = iservice.supportQus(sseq);
		
		model.addAttribute("qList", qList);
		model.addAttribute("list", list);
		model.addAttribute("sseq", sseq);
		
		return "supportQus";
	}
	
	@RequestMapping(value="/ChangeSupportQ.do", method=RequestMethod.POST)
	public String ChangeSupportQ(Model model,String sseq,String[] chk)
	{
		iservice.ChangeSupportQ(sseq,chk);
		
		return "redirect:/supportList.do";
	}
	
	

}
