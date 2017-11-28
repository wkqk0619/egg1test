package com.hk.lab5;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.lab5.dtos.NotionDto;
import com.hk.lab5.model.IService;

@Controller
public class NotionController {

	
	@Autowired
	private IService iservice;
	
	@RequestMapping(value="selectNotion.do", method=RequestMethod.GET)
	public String selectNotion(Model model) {
		List<NotionDto> list = iservice.selectNotion();
		model.addAttribute("notList",list);
		return "notionList";
	}
	
	
	
	@RequestMapping(value="ajaxNotionDetail.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, NotionDto> ajaxNotionDetail(String nseq){
		NotionDto dto = iservice.ajaxNotionDetail(nseq);
		Map<String, NotionDto> map = new HashMap<String, NotionDto>();
		map.put("dto", dto);
		return map;
	}
	
	@RequestMapping(value="delNot.do", method=RequestMethod.GET)
	public String delNot(int nseq) {
		int bool = iservice.delNot(nseq);
		if(bool==0) {
			System.out.println("false");
		}else {
			System.out.println("Good");
		}
		return "redirect:/selectNotion.do";
	}
	
	@RequestMapping(value="insertNot.do",method=RequestMethod.POST)
	public String insertNot(NotionDto dto) {
		int bool = iservice.insertNot(dto);
		if(bool==0) {
			System.out.println("false");
		}else {
			System.out.println("Good");
		}
		return "redirect:/selectNotion.do";
	}
	
	@RequestMapping(value="updateNot.do",method=RequestMethod.POST)
	public String updateNot(NotionDto dto) {
		System.out.println(dto);
		int bool = iservice.updateNot(dto);
		if(bool==0) {
			System.out.println("false");
		}else {
			System.out.println("Good");
		}
		return "redirect:/selectNotion.do";
	}
	
}















