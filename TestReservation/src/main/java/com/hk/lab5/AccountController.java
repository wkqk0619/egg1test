package com.hk.lab5;

import java.io.File;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hk.lab5.dtos.AccountDto;
import com.hk.lab5.model.IService;

@Controller
public class AccountController {
	
	@Autowired
	private IService iservice;
	
	@Resource(name="uploadPath")
	   String uploadPath;
	
	@Resource(name="uploadrealPath")
	   String uploadrealPath;
	
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
	
	//판매자메인화면으로 이동
	@RequestMapping(value="/sellerMain.do", method=RequestMethod.GET)
	public String sellerMain() {
		return "sellerMain";
	}
	
	//구매자메인화면으로 이동
	@RequestMapping(value="/buyerMain.do", method=RequestMethod.GET)
	public String buyerMain() {
		return "buyerMain";
	}
	
	//유저 이력 확인 페이지로 이동
	@RequestMapping(value="/MyList.do", method=RequestMethod.GET)
	public String MyList() {
		return "MyList";
	}
	
	
	//로그인 후 유저메인으로 이동
	@RequestMapping(value="/userLogin.do", method=RequestMethod.POST)
	public String userLogin(String email, String password, HttpSession session) {
		Map<String, String>map = new HashMap<String,String>();
		map.put("id", email);
		map.put("password", password);
		AccountDto ldto = iservice.login(map);
		if(ldto==null)
		{
			return "redirect:/LoginPage.do";
		}
		else
		{
//			System.out.println(ldto);
			session.setAttribute("ldto", ldto);
			return "userMain";
		}
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
	public String insertFile(HttpSession session,  MultipartHttpServletRequest req,MultipartFile file) throws Exception 
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
		dto.setImage(filepath);
		int bool = iservice.updateFile(dto);
		if(bool==0) 
		{
			System.out.println("false");
		}else 
		{
			File target = new File(uploadPath+"\\"+savedName);
		    System.out.println("타겟 저장경로 : "+target.getPath());
		    FileCopyUtils.copy(file.getBytes(), target);
		     
		    AccountDto oldto = (AccountDto)session.getAttribute("ldto");
				
			Map<String, String>map = new HashMap<String,String>();
			map.put("id", oldto.getId());
			map.put("password", oldto.getPassword());
				
			AccountDto ldto = iservice.login(map);
			session.setAttribute("ldto", ldto);
		}
				
		return "redirect:/Mypage.do";
	}

	@RequestMapping(value="/EmailCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public String regist(String email)
	{
		if(iservice.emailChk(email))
		{
			return "O";
		}
		else
		{
			return iservice.emailSend(email,"R");				
		}
	}
	
	@RequestMapping(value="/regist.do", method=RequestMethod.POST)
	public String regist(String id, String password)
	{
		Map<String, String> map = new HashMap<String,String>();
		map.put("id", id);
		map.put("password", password);
		boolean isS = iservice.regist(map);
		
		return "redirect:/LoginPage.do";
	}
	
	@RequestMapping(value="/coupon.do", method=RequestMethod.POST)
	public String coupon(HttpSession session, String code)
	{
		
		boolean isS=false;
		AccountDto oldto = (AccountDto)session.getAttribute("ldto");
		
		Map<String, String> map = new HashMap<String,String>();
		map.put("id", oldto.getId());
		map.put("code", code);
		if(iservice.couponChk(code))
		{
			isS = iservice.coupon(map);
		}
		
		if(isS)
		{
			Map<String, String>map2 = new HashMap<String,String>();
			map2.put("id", oldto.getId());
			map2.put("password", oldto.getPassword());
					
			AccountDto ldto = iservice.login(map2);
			session.setAttribute("ldto", ldto);
		}
		
		
		return "redirect:/Mypage.do";
	}
	
}
