package com.hk.lab5;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.lab5.dtos.AccountDto;
import com.hk.lab5.dtos.NotionDto;
import com.hk.lab5.model.IService;

@Controller
public class NotionController {

	@Autowired
	private IService iservice;
	
	//공지사항 게시글로 이동
	@RequestMapping(value="/NotionBoard.do", method=RequestMethod.GET)
	public String NotionBoard(HttpSession session, Model model)
	{
		AccountDto ldto = (AccountDto)session.getAttribute("ldto");
		
		List<NotionDto> list = iservice.notionBoard(ldto.getId());
		model.addAttribute("list", list);
		
		return "NotionBoard";
	}
	
}
