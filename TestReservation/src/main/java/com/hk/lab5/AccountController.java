package com.hk.lab5;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Controller
public class AccountController {
	
	@Resource(name="uploadPath")
	   String uploadPath;
	
	//로그인 페이지로 이동
	@RequestMapping(value="/LoginPage.do", method=RequestMethod.GET)
	public String LoginPage() {
		return "LoginPage";
	}
	
	//유저메인화면으로 이동
	@RequestMapping(value="/userMain.do", method=RequestMethod.GET)
	public String userMain() {
		return "userMain";
	}
	
	
	//로그인 후 유저메인으로 이동
	@RequestMapping(value="/userLogin.do", method=RequestMethod.POST)
	public String userLogin(String email, String password, HttpSession session) {
		Map<String, String>map = new HashMap<String,String>();
		map.put("email", email);
		map.put("password", password);
		session.setAttribute("ldto", map);
		return "userMain";
	}
	
	//유저 마이페이지
	@RequestMapping(value="/Mypage.do", method=RequestMethod.GET)
	public String Mypage() {
		return "Mypage";
	}
	
	
	//유저 로그아웃 -> 세션 삭제
	@RequestMapping(value="/userLogout.do", method=RequestMethod.GET)
	public String userLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/LoginPage.do";
	}
	
	//회원가입 페이지로
	@RequestMapping(value="/ReguserPage.do", method=RequestMethod.GET)
	public String ReguserPage() {
		return "ReguserPage";
	}
	
	//프로필 이미지 업로드 
	@RequestMapping(value="/fileUpload.do",method=RequestMethod.POST)
	public String insertFile(/* HttpSession session, */ MultipartHttpServletRequest req,MultipartFile file) throws Exception 
	{
		System.out.println("파일이름 :"+file.getOriginalFilename());
		System.out.println("파일크기 : "+file.getSize());
		System.out.println("컨텐트 타입 : "+file.getContentType());
		System.out.println("기본저장위치"+uploadPath);
		
		UUID uuid = UUID.randomUUID();
		String savedName = uuid.toString()+"_"+file.getOriginalFilename();
		
		//dto.setIcon(uploadPath+"\\"+savedName);
		String filepath = "profileImage/"+savedName;
		
		
		
			File target = new File(uploadPath+"\\"+savedName);
		     System.out.println("타겟 저장경로 : "+target.getPath());
		     FileCopyUtils.copy(file.getBytes(), target);
		     
				
		return "redirect:/Mypage.do";
	}

}
