package com.hk.lab5;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.lab5.dtos.AnswerDto;
import com.hk.lab5.dtos.QuestionDto;
import com.hk.lab5.model.IService;

@Controller
public class QuestionCotroller {
	
	@Autowired
	private IService iservice;
	
	@RequestMapping(value="/insertQuestion.do",method=RequestMethod.POST)
	public String InsertQuestion(String question) {
		int bool = iservice.InsertQuestion(question);
		if(bool==0) {
			System.out.println("false");
		}else {
			System.out.println("Good");
		}
		return "redirect:/selectQuestion.do";
	}
	@RequestMapping(value="/selectQuestion.do",method=RequestMethod.GET)
	public String selectQuestion(Model model) {
		List<QuestionDto> lists = iservice.selectQuestion();
		model.addAttribute("lists",lists);
		return "questionBoard";
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
	
	@RequestMapping(value="/statisticsQus.do",method=RequestMethod.GET)
	public String statisticsQus(Model model,String qseq)
	{
		List<AnswerDto> lists = iservice.statisticsQus(qseq);
		model.addAttribute("lists",lists);
		model.addAttribute("qseq", qseq);
		
		return "statisticsQus";
	}
	
	@RequestMapping(value="/userAllAnswer.do",method=RequestMethod.GET)
	public String userAllAnswer(Model model, String id, String qseq)
	{
		List<AnswerDto> lists = iservice.userAllAnswer(id);
		model.addAttribute("lists",lists);
		model.addAttribute("qseq", qseq);
		
		return "userAllAnswer";
	}
	
}


















