package com.hk.lab5;

import java.io.File;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hk.lab5.dtos.FileUploadDto;
import com.hk.lab5.model.IService;

@Controller
public class FileUploadController {
	
	 @Resource(name="uploadPath")
	   String uploadPath;
	 
		@Autowired
		private IService iservice;
	
	@RequestMapping(value="/fileTest.do",method=RequestMethod.GET)
	public String uploadTestpage() {
		return "uploadTestpage";
	}
	
	/*
	@RequestMapping(value="/fileUpload.do",method=RequestMethod.POST)
	public String insertFile(MultipartHttpServletRequest req,MultipartFile file) throws Exception 
	{
		 
		System.out.println("파일이름 :"+file.getOriginalFilename());
		System.out.println("파일크기 : "+file.getSize());
		System.out.println("컨텐트 타입 : "+file.getContentType());
		System.out.println("기본저장위치"+uploadPath);
		FileUploadDto dto = new FileUploadDto();
		String savedName = file.getOriginalFilename();
		dto.setId(req.getParameter("id"));
		dto.setFileurl(uploadPath+"\\"+savedName);
		
		int bool = iservice.insertFileUpload(dto);
		if(bool==0) 
		{
			System.out.println("false");
		}else 
		{
			File target = new File(uploadPath+"\\"+savedName);
		     System.out.println("타겟 저장경로 : "+target.getPath());
		     FileCopyUtils.copy(file.getBytes(), target);
		}
		return "redirect:/fileTest.do";
	}
	*/
	
	
}
