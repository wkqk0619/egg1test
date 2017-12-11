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
import com.hk.lab5.dtos.MySupportDto;
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

	@RequestMapping(value="/addMySupport.do", method=RequestMethod.POST)
	@ResponseBody
	public String addMySupport(HttpSession session ,String sseq)
	{		
		AccountDto ldto = (AccountDto)session.getAttribute("ldto");
		
		Map<String, String> map = new HashMap<String,String>();
		map.put("sseq", sseq);
		map.put("id", ldto.getId());
		
		if(iservice.chkMySupport(map))
		{
			return "O";
		}
		
		boolean isS = false;
		isS = iservice.addMySupport(map);
		
		if(isS)
		{
			return "T";
		}
		else
		{
			return "F";
		}	
	}
	
	@RequestMapping(value="/mySupportList.do", method=RequestMethod.GET)
	public String mySupportList(Model model,HttpSession session)
	{
		AccountDto ldto = (AccountDto)session.getAttribute("ldto");
		List<SupportDto> list = iservice.mySupportList(ldto.getId());
		model.addAttribute("list", list);
		
		return "mySupport";
	}
	
	@RequestMapping(value="/delMySupport.do", method=RequestMethod.GET)
	public String delMySupport(HttpSession session ,String sseq)
	{		
		AccountDto ldto = (AccountDto)session.getAttribute("ldto");
		
		Map<String, String> map = new HashMap<String,String>();
		map.put("sseq", sseq);
		map.put("id", ldto.getId());
		
		if(iservice.delMySupport(map))
		{
			return "redirect:/mySupportList.do";
		}
		else
		{
			return "error";
		}		
	}
	
	// 주의: 기타에 대한 사항은 아직 처리하지 않았음
	@RequestMapping(value="/searchSupport.do", method=RequestMethod.POST)
	public String searchSupport(Model model,String type, String target, String area)
	{
		Map<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("target", target);
		map.put("area", area);
		
		List<SupportDto> list = iservice.searchSupport(map);
		model.addAttribute("list", list);
		
		return "supportBoard";
	}
	
	
}
