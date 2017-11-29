package com.hk.lab5;

import java.util.ArrayList;
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
import com.hk.lab5.dtos.NotionDto;
import com.hk.lab5.dtos.QnaDto;
import com.hk.lab5.model.IService;

@Controller
public class QnaController 
{
	@Autowired
	private IService iservice;
	
	@RequestMapping(value="/qnaList.do", method=RequestMethod.GET)
	public String qnaList(Model model, HttpSession session)
	{
		AccountDto ldto = (AccountDto)session.getAttribute("ldto");
		
		List<QnaDto> list = new ArrayList<QnaDto>();
		list = iservice.qnaList(ldto);
		
		model.addAttribute("list", list);
		
		return "qnaBoard";
	}
	
	@RequestMapping(value="/insertQna.do", method=RequestMethod.POST)
	public String insertQna(QnaDto dto)
	{
		boolean isS = iservice.insertQna(dto);
		
		if(isS)
		{
			return "redirect:/qnaList.do";			
		}
		else
		{
			return "error";
		}
	}
	
	@RequestMapping(value="/ajaxQnaDetail.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> ajaxQnaDetail(String aseq,HttpSession session)
	{
		Map<String,Object> map = new HashMap<String,Object>();
		QnaDto dto = iservice.ajaxQnaDetail(aseq);
		map.put("dto", dto);
		
		AccountDto ldto = (AccountDto)session.getAttribute("ldto");
		
		if(dto.getId().equals(ldto.getId()))
		{
			map.put("isS", true);
		}
		else
		{
			map.put("isS", false);
		}
		
		return map;
	}
	
	@RequestMapping(value="/deleteQna.do",method=RequestMethod.GET)
	public String deleteQna(String aseq)
	{
		boolean isS = iservice.deleteQna(aseq);
		
		if(isS)
		{
			return "redirect:/qnaList.do";
		}
		else
		{
			return "error";
		}
	}
	
	@RequestMapping(value="/updateQna.do",method=RequestMethod.POST)
	public String updateQna(QnaDto dto)
	{
		boolean isS = iservice.updateQna(dto);
		
		if(isS)
		{
			return "redirect:/qnaList.do";
		}
		else
		{
			return "error";
		}
	}
	
	@RequestMapping(value="/insertReplyQna.do",method=RequestMethod.POST)
	public String insertReplyQna(QnaDto dto)
	{
		boolean isS = iservice.insertReplyQna(dto);
		
		if(isS)
		{
			return "redirect:/qnaList.do";
		}
		else
		{
			return "error";
		}
	}
	
	
}
