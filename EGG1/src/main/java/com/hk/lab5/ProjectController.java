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

import com.hk.lab5.dtos.ProjectDto;
import com.hk.lab5.model.IService;

@Controller
public class ProjectController {
	
	
	@Autowired
	private IService iservice;
	
	
	@RequestMapping(value="/selectProject.do",method=RequestMethod.GET)
	public String selectProject(Model model){
		List<ProjectDto> list = iservice.selectProject();
		System.out.println(list);
		model.addAttribute("prlist", list);
		return "project";
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
	
	
	

}
