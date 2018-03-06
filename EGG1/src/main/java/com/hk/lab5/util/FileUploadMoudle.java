package com.hk.lab5.util;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hk.lab5.dtos.AccountDto;
import com.hk.lab5.model.IService;

@Controller
public class FileUploadMoudle {
	/*
	@Autowired
	private IService iservice;
	*/
	/*
	@Resource(name="uploadPath")
	   String uploadPath;
	   */
	
	public void FileUpload(HttpSession session,MultipartHttpServletRequest req,MultipartFile file ,String uploadPath,IService iservice) throws IOException 
	{
		System.out.println("파일이름 :"+file.getOriginalFilename());
		System.out.println("파일크기 : "+file.getSize());
		System.out.println("컨텐트 타입 : "+file.getContentType());
		System.out.println("기본저장위치"+uploadPath);
		AccountDto dto = new AccountDto();
		UUID uuid = UUID.randomUUID();
		String savedName = uuid.toString()+"_"+file.getOriginalFilename();
		dto.setId(req.getParameter("id"));
		//dto.setIcon(uploadPath+"\\"+savedName);
		String filepath = "profileImage/"+savedName;
		dto.setIcon(filepath);
		int bool = iservice.updateFile(dto);
		if(bool==0) 
		{
			System.out.println("false");
		}else 
		{	
				AccountDto oldto = (AccountDto)session.getAttribute("ldto");
				File target = new File(uploadPath+"\\"+savedName);
		     	System.out.println("타겟 저장경로 : "+target.getPath());
		     	FileCopyUtils.copy(file.getBytes(), target);
				Map<String, String>map = new HashMap<String,String>();
				map.put("id", oldto.getId());
				map.put("pw", oldto.getPassword());
				AccountDto ldto = iservice.login(map);
				session.setAttribute("ldto", ldto);
		}
		
	}
}
