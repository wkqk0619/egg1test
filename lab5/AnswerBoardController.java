package com.hk.lab5;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.lab5.dtos.AnswerBoardDto;
import com.hk.lab5.model.IService;

@Controller
public class AnswerBoardController {
	
	@Autowired
	private IService iservice;
	
	@RequestMapping(value="/selectAllBoard.do",method=RequestMethod.GET)
	public String selectAllboard(Model model, String name) {
		List<AnswerBoardDto> lists= iservice.selectAllboard();
		model.addAttribute("lists",lists);
		return "BoardList";
	}
}

















