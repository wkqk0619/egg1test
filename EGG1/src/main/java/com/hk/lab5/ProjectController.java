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
import com.hk.lab5.dtos.AnswerDto;
import com.hk.lab5.dtos.ProjectDto;
import com.hk.lab5.dtos.QuestionDto;
import com.hk.lab5.model.IService;

@Controller
public class ProjectController {
	
	
	@Autowired
	private IService iservice;
	
	
	@RequestMapping(value="/selectProject.do",method=RequestMethod.GET)
	public String selectProject(Model model,HttpSession session){
		AccountDto ldto = (AccountDto)session.getAttribute("ldto");
		List<ProjectDto> list = iservice.selectProject(ldto.getId());
		System.out.println(list);
		model.addAttribute("prlist", list);
		return "projectBoard";
	}
	
	
	@RequestMapping(value="/insertProject.do", method=RequestMethod.POST)
	public String insertProject(ProjectDto dto) {
		int bool = iservice.insertProject(dto);
		if(bool==0) {
			System.out.println("false");
		}else {
			System.out.println("Good");
		}
		return "redirect:/selectProject.do";
	}
	
	@RequestMapping(value="/ajaxProjDetail.do",method=RequestMethod.POST)
	@ResponseBody
	public Map<String, ProjectDto> ajaxProjDetail(String pseq){
		ProjectDto dto = iservice.ajaxProjDetail(pseq);
		Map<String, ProjectDto> map = new HashMap<String, ProjectDto>();
		map.put("dto", dto);
		return map;
	}
	
	
	@RequestMapping(value="/updateProject.do",method=RequestMethod.POST)
	public String updateProject(ProjectDto dto) {
		int bool = iservice.updateProject(dto);
		if(bool==0) {
			System.out.println("false");
		}else {
			System.out.println("Good");
		}
		return "redirect:/selectProject.do";
	}
	
	@RequestMapping(value="/deleteProject.do", method=RequestMethod.GET)
	public String deleteProject(String pseq) {
		int bool = iservice.deleteProject(pseq);
		if(bool==0) {
			System.out.println("false");
		}else {
			System.out.println("Good");
		}
		return "redirect:/selectProject.do";
	}
	
	@RequestMapping(value="/ajaxProject.do",method=RequestMethod.POST)
	@ResponseBody
	public List<ProjectDto> ajaxProject(String id)
	{
		List<ProjectDto> list = iservice.selectProject(id);
		return list;
	}
	
	@RequestMapping(value="/insertAnswerForm.do",method=RequestMethod.GET)
	public String insertAnswerForm(Model model, String pseq, String sseq)
	{
		// 지원사업 필요 질문들 찾기 SELECT QSEQ FROM SUPPORTQ WHERE SSEQ = #{sseq}
		List<QuestionDto> qList = iservice.supportQus(sseq);
		// 프로젝트에 있는 지원사업필요 답변들 찾기 
		// DB로 처리하는경우
		// SELECT QSEQ ANSWER FROM ANSWER WHERE QSEQ IN (SELECT QSEQ FROM SUPPORTQ WHERE SSEQ = #{sseq}) AND PSEQ = #{pseq}
		// service단 OR 회면단에서 처리할경우
		// SELECT QSEQ ANSWER FROM ANSWER WHERE PSEQ = #{pseq} 이후 위에서 구한 지원사업 필요 질문이랑 비교
		List<AnswerDto> aList = iservice.selectAnswer(pseq);
				
		model.addAttribute("qList", qList);
		model.addAttribute("aList", aList);
		model.addAttribute("pseq", pseq);
//		model.addAttribute("sseq", sseq);
		
		
		return "answerForm";
	}
	
	@RequestMapping(value="/writeAnswer.do",method=RequestMethod.POST)
	public String writeAnswer(Model model, String[] qseq, String[] answer, String pseq, String[] question)
	{
		List<AnswerDto> list = new ArrayList<AnswerDto>();
		for(int i=0; i < qseq.length ; i++)
		{
			list.add(new AnswerDto(Integer.parseInt(pseq), Integer.parseInt(qseq[i]), answer[i]));
		}
		iservice.writeAnswer(list);
		
		model.addAttribute("answer", answer);
		model.addAttribute("question", question);		
		
		//return "result2";
		return "JSPDF";
	}
	

}
