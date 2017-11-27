package com.hk.lab5;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class FileUploadController {
	
	@RequestMapping(value="/fileTest.do",method=RequestMethod.GET)
	public String uploadTestpage() {
		return "uploadTestpage";
	}
	
}
