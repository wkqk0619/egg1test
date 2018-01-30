package com.hk.lab5;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hk.lab5.dtos.NotionDto;
import com.hk.lab5.dtos.RestoreProjDto;
import com.hk.lab5.model.IService;

@Controller
public class RestoreProjController {
	
	@Autowired
	private IService iservice;
	
	@RequestMapping(value="/restoreProj.do",method=RequestMethod.GET)
	public String restoreProj()
	{
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
		return "redirect:/selectNotion.do";
	}

}
