package com.hk.lab5;

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
import com.hk.lab5.model.IService;

@Controller
public class AccountController 
{
	@Autowired
	private IService iservice;
	
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
	public String login(String id,String pw, HttpSession session)
	{
		Map<String, String>map = new HashMap<String,String>();
		map.put("id", id);
		map.put("pw", pw);
		
		AccountDto ldto = iservice.login(map);
		
		if(ldto==null)
		{
			return "F";
		}
		else
		{
			session.setAttribute("ldto", ldto);
			return "S";
		}
		
	}
	
	@RequestMapping(value="/EggLogout.do", method=RequestMethod.GET)
	public String login(HttpSession session)
	{
		AccountDto ldto = (AccountDto)session.getAttribute("ldto");
		if(ldto.getRole()=='U')
		{
			session.invalidate();
			return "redirect:/Main.do";
		}
		else
		{
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
			
			return "myPage";
		}
		else 
		{
			return "error";
		}
		
	}
	
	
}
