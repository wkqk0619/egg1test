package com.hk.lab5;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.lab5.dtos.AccountDto;
import com.hk.lab5.dtos.QnaDto;
import com.hk.lab5.model.IService;

@Controller
public class QnaController {
	
	@Autowired
	private IService iservice;
	
	@RequestMapping(value="/QnaBoard.do", method=RequestMethod.GET)
	public String QnaBoard(HttpSession session, Model model)
	{
		AccountDto ldto = (AccountDto)session.getAttribute("ldto");
		
		List<QnaDto> list = iservice.qnaBoard(ldto.getId());
		model.addAttribute("list", list);
		
		return "QnaBoard";
	}

}
