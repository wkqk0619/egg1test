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
public class QuestionCotroller {
	
	@Autowired
	private IService iservice;
	
	@RequestMapping(value="/insertQuestion.do",method=RequestMethod.POST)
	public String InsertQuestion(String qname) {
		int bool = iservice.InsertQuestion(qname);
		if(bool==0) {
			System.out.println("false");
		}else {
			System.out.println("Good");
		}
		return "redirect:/selectQuestion.do";
	}
	@RequestMapping(value="/selectQuestion.do",method=RequestMethod.GET)
	public String selectQuestion(Model model,String name) {
		List<QuestionDto> lists = iservice.selectQuestion();
		model.addAttribute("lists",lists);
		return "Question";
	}
	
	@RequestMapping(value="/deleteQuestion.do",method=RequestMethod.POST)
	public String deleteQuestion(int qseq){
		int bool=iservice.deleteQuestion(qseq);
		if(bool==0) {
			System.out.println("false");
		}else {
			System.out.println("Good");
		}
		return "redirect:/selectQuestion.do";
	}
}


















