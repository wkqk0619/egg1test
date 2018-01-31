package com.hk.lab5;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hk.lab5.dtos.ProjectDto;
import com.hk.lab5.dtos.RestoreProjDto;
import com.hk.lab5.model.IService;

@Controller
public class RestoreProjController {
	
	@Autowired
	private IService iservice;
	
	@RequestMapping(value="/restoreProj.do",method=RequestMethod.GET)
	public String restoreProj(Model model)
	{
		List<RestoreProjDto> list = iservice.selectrestoreproj();
		model.addAttribute("ResList",list);
		return "restoreProjMain";
	}
	
	@RequestMapping(value="/insertrestoreProj.do",method=RequestMethod.POST)
	public String insertrestoreProj(RestoreProjDto dto) {
		System.out.println("들어는 왔네");
		int bool = iservice.insertRestoreProj(dto);
		if(bool==0) {
			System.out.println("false");
		}else {
			System.out.println("Good");
		}
		return "redirect:/selectProject.do";
	}
	
	@RequestMapping(value="/ajaxProjSelect.do",method=RequestMethod.POST)
	@ResponseBody
	public int ajaxProjSelect(ProjectDto dto) 
	{
		int result = 0;
		dto =  iservice.ajaxProjSelect(dto);
		System.out.println("결과좀 볼까??"+dto);
		if(dto != null) 
		{
			result=1;
		}
		System.out.println("result 값은??"+result);
		return result;
	}
	
	@RequestMapping(value="/UpResProject.do", method=RequestMethod.POST)
	@ResponseBody
	public int UpResProject(ProjectDto dto) {
		int bool = iservice.UpResProject(dto);
		if(bool==0) {
			System.out.println("false");
		}else {
			System.out.println("Good");
		}
		return bool;
	}
	
	@RequestMapping(value="/deleteRestoreList.do", method=RequestMethod.GET)
	//@ResponseBody
	public String deleteRestoreList(RestoreProjDto dto) 
	{
		int bool = iservice.deleteRestoreList(dto);
		if(bool==0) {
			System.out.println("false");
		}else {
			System.out.println("Good");
		}
		//return bool;
		return "redirect:/restoreProj.do";
	}
	
	@RequestMapping(value="/ajaxselectRestoreProj.do", method=RequestMethod.POST)
	@ResponseBody
	public List<RestoreProjDto> ajaxselectRestoreProj()
	{
		List<RestoreProjDto> list = iservice.ajaxselectRestoreProj();
		System.out.println("List 결과 : !!"+list);
		
		if(list == null) 
		{
			
			System.out.println("널로 취급");
		}
		else {
			System.out.println("널이 아닌거");
		}
		System.out.println("리스트가 비었나??"+list.isEmpty());
		if(list.isEmpty() == true) 
		{
			list = null;
		}
		System.out.println("리스트 최종 값!!"+list);
		return list;
	}
	

}
