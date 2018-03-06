package com.hk.lab5;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.hk.lab5.dtos.AccountDto;
import com.hk.lab5.dtos.FileUploadDto;
import com.hk.lab5.dtos.LogDto;
import com.hk.lab5.model.IService;
import com.hk.lab5.util.FileUploadMoudle;

@Controller
public class AccountController 
{
	@Autowired
	private IService iservice;
	
	
	 @Resource(name="uploadPath")
	   String uploadPath;
	   
	
	@RequestMapping(value="/Main.do", method=RequestMethod.GET)
	public String usermain()
	{
		
		return "ajaxindex";
//		return "index";
	}
	@RequestMapping(value="/AdminMain.do", method=RequestMethod.GET)
	public String adminmain()
	{
		return "adminindex";
	}
	
	@RequestMapping(value="/LoginMain.do", method=RequestMethod.GET)
	public String userLoginMain(HttpSession session, Model model)
	{
		
		AccountDto ldto = (AccountDto)session.getAttribute("ldto");
		
		if(ldto == null)
		{
			model.addAttribute("msg", "�꽭�뀡�씠 留뚮즺�릺�뿀�뒿�땲�떎.");
			return "ajaxindex";
//			return "index";
		}		
		else if(ldto.getRole() == 'U')
		{
			return "ajaxindex";
//			return "main";
		}
		else
		{
			return "adminmain";
		}
	}
	
	/*
	 * �쐞�쓽 硫붿씤怨� �넻�빀
	@RequestMapping(value="/AdminLoginMain.do", method=RequestMethod.GET)
	public String AdminLoginMain()
	{
		return "adminmain";
	}
	*/
	
	
	// 媛��엯�븷�븣 �씠硫붿씪�뿉 �씤利앸찓�씪 蹂대깂
	@RequestMapping(value="/EmailCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public String regist(String email)
	{
		// �븘�씠�뵒 以묐났寃��궗 true = �씠誘� 議댁옱�븿 false = �뾾�쓬
		if(iservice.emailChk(email))
		{
			return "O";
		}
		else
		{
			return iservice.emailSend(email,"R");
		}
	}
	
	// 媛��엯
	@RequestMapping(value="/Regist.do", method=RequestMethod.POST)
	@ResponseBody
	public String regist(String email,String pw)
	{
		System.out.println(email+"  :  "+pw);
		if(iservice.regist(email,pw))
		{
			return "S";
		}
		else
		{
			return "F";
		}
	}
	
	// 鍮꾨�踰덊샇 李얠쓣�븣 �씤利앸찓�씪 蹂대깂
	@RequestMapping(value="/FindCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public String find(String email)
	{
		// �븘�씠�뵒 議댁옱�솗�씤 true = �씠誘� 議댁옱�븿 false = �뾾�쓬
		if(iservice.emailChk(email))
		{
			return iservice.emailSend(email,"P");
		}
		else
		{
			return "O";
		}
	}
	
	// 硫붿씪濡� 鍮꾨�踰덊샇 �쟾�넚
	@RequestMapping(value="/Sendpw.do", method=RequestMethod.POST)
	@ResponseBody
	public String sendpw(String email)
	{
		return iservice.emailSend(email, "F");
	}
	
	@RequestMapping(value="/Login.do", method=RequestMethod.POST)
	@ResponseBody
	public String login(String id,String pw, HttpSession session, HttpServletRequest request)
	{
		Map<String, String>map = new HashMap<String,String>();
		map.put("id", id);
		map.put("pw", pw);
		
		AccountDto ldto = iservice.login(map);
		if(ldto==null)
		{
			iservice.insertLog(id,request.getRemoteAddr(),"F");
			return "F";
		}
		else
		{
			if(ldto.getEnabled()=='N')
			{
				iservice.insertLog(id,request.getRemoteAddr(),"R");
				return "O";
			}
			else
			{
				iservice.insertLog(id,request.getRemoteAddr(),"S");
				session.setAttribute("ldto", ldto);
				return "S";
			}
		}
		
	}
	
	@RequestMapping(value="/EggLogout.do", method=RequestMethod.GET)
	public String login(HttpSession session, HttpServletRequest request)
	{
		AccountDto ldto = (AccountDto)session.getAttribute("ldto");
		
		
		if(ldto==null)
		{
			return "redirect:/Main.do";
		}
		else if(ldto.getRole()=='U')
		{
			iservice.insertLog(ldto.getId(),request.getRemoteAddr(),"O");
			session.invalidate();
			return "redirect:/Main.do";
		}
		else
		{
			iservice.insertLog(ldto.getId(),request.getRemoteAddr(),"O");
			session.invalidate();
			return "redirect:/AdminMain.do";
		}
	}
	
	@RequestMapping(value="/userList.do", method=RequestMethod.GET)
	public String login(Model model)
	{
		List<AccountDto> list = iservice.userList();
		model.addAttribute("list", list);
		
		return "userList";
	}
	
	@RequestMapping(value="/ajaxUserDetail.do", method=RequestMethod.POST)
	@ResponseBody
	public AccountDto ajaxUserDetail(String id)
	{
		AccountDto dto = iservice.ajaxUserDetail(id);
		return dto;
	}
	
	@RequestMapping(value="/updateUser.do", method=RequestMethod.POST)
	public String updateUser(AccountDto dto)
	{
		boolean isS = iservice.updateUser(dto);
		if(isS) 
		{
			return "redirect:/userList.do";
		}
		else 
		{
			return "error";
		}
		
	}
	
	@RequestMapping(value="/myPage.do", method=RequestMethod.GET)
	public String myPage()
	{
		return "myPage";
	}
	
	@RequestMapping(value="/upNickName.do", method=RequestMethod.POST)
	public String upNickName(HttpSession session, AccountDto dto)
	{
		boolean isS = iservice.upNickName(dto);
		if(isS) 
		{
			// (援�)�꽭�뀡�뜲�씠�꽣
			AccountDto oldto = (AccountDto)session.getAttribute("ldto");
			
			Map<String, String>map = new HashMap<String,String>();
			map.put("id", oldto.getId());
			map.put("pw", oldto.getPassword());
			
			AccountDto ldto = iservice.login(map);
			session.setAttribute("ldto", ldto);
			
			return "myPage";
		}
		else 
		{
			return "error";
		}
		
	}
	
	@RequestMapping(value="/upPassword.do", method=RequestMethod.POST)
	public String upPassword(HttpSession session, AccountDto dto)
	{
		boolean isS = iservice.upPassword(dto);
		if(isS) 
		{
			// (援�)�꽭�뀡�뜲�씠�꽣
			AccountDto oldto = (AccountDto)session.getAttribute("ldto");
			
			Map<String, String>map = new HashMap<String,String>();
			map.put("id", oldto.getId());
			map.put("pw", dto.getPassword());
			
			AccountDto ldto = iservice.login(map);
			session.setAttribute("ldto", ldto);
			
			return "redirect:/myPage.do";
		}
		else 
		{
			return "error";
		}
		
	}
	@RequestMapping(value="/secession.do", method=RequestMethod.GET)
	public String secession(HttpSession session)
	{
		AccountDto ldto = (AccountDto)session.getAttribute("ldto");
		iservice.secession(ldto);
		session.invalidate();
		
		return "redirect:/Main.do";
	}
	
	@RequestMapping(value="/recoveryAccount.do", method=RequestMethod.GET)
	public String recoveryAccount(Model model,String email)
	{
		model.addAttribute("email", email);
		return "recoveryAccount";
	}
	
	@RequestMapping(value="/recoveryCheck.do", method=RequestMethod.POST)
	@ResponseBody
	public String recoveryCheck(Model model,String email)
	{
		return iservice.emailSend(email,"C");
	}
	
	@RequestMapping(value="/recovery.do", method=RequestMethod.GET)
	public String recovery(String email)
	{
		iservice.recovery(email);
		return "redirect:/Main.do";
	}
	
	@RequestMapping(value="/logList.do", method=RequestMethod.GET)
	public String logList(Model model)
	{
		List<LogDto> list = new ArrayList<LogDto>();
		list = iservice.logList();
		
		model.addAttribute("list", list);
		
		return "logList";
	}
	
	@RequestMapping(value="/myLog.do", method=RequestMethod.GET)
	public String myLog(HttpSession session, Model model)
	{
		AccountDto ldto = (AccountDto)session.getAttribute("ldto");		
		List<LogDto> list = new ArrayList<LogDto>();
		list = iservice.myLog(ldto.getId());
		
		model.addAttribute("list", list);
		
		return "myLog";
	}
	
	@RequestMapping(value="/searchLog.do", method=RequestMethod.POST)
	public String searchLog(Model model, String type, String search, String date, String logtype)
	{
		List<LogDto> list = new ArrayList<LogDto>();
		Map<String, String> map = new HashMap<String, String>();
		map.put("type", type);
		map.put("search", search);
		map.put("date", date);
		map.put("logtype", logtype);
		
		list = iservice.searchLog(map);		
		model.addAttribute("list", list);
		
		return "logList";
	}
	
	@RequestMapping(value="/fileUpload.do",method=RequestMethod.POST)
	public String insertFile(HttpSession session,MultipartHttpServletRequest req,MultipartFile file) throws Exception 
	{
		 /*
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
		*/
		FileUploadMoudle filemd = new FileUploadMoudle();
		filemd.FileUpload(session, req, file,uploadPath,iservice);
		
		return "redirect:/myPage.do";
	}
	
}
