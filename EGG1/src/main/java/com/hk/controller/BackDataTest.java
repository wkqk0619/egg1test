package com.hk.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.LoginDao;

/**
 * Servlet implementation class BackDataTest
 */
@WebServlet("/BackDataTest.do")
public class BackDataTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BackDataTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String command = request.getParameter("command");
		if(command.equals("backData"))
		{
			String[] areaname = request.getParameterValues("areaname");
			String[] biztitle = request.getParameterValues("biztitle");
			String[] detailurl = request.getParameterValues("detailurl");
			String[] enddate = request.getParameterValues("enddate");
			String[] insertdate = request.getParameterValues("insertdate");
			String[] organizationname = request.getParameterValues("organizationname");
			String[] posttarget = request.getParameterValues("posttarget");
			String[] posttargetage = request.getParameterValues("posttargetage");
			String[] posttargetcomage = request.getParameterValues("posttargetcomage");
			String[] startdate = request.getParameterValues("startdate");
			String[] supporttype = request.getParameterValues("supporttype");
			String[] title = request.getParameterValues("title");
							
			Map<String,String[]> map = new HashMap<String,String[]>();
			map.put("areaname",areaname);
			map.put("biztitle",biztitle);
			map.put("detailurl",detailurl);
			map.put("enddate",enddate);
			map.put("insertdate",insertdate);
			map.put("organizationname",organizationname);
			map.put("posttarget",posttarget);
			map.put("posttargetage",posttargetage);
			map.put("posttargetcomage",posttargetcomage);
			map.put("startdate",startdate);
			map.put("supporttype",supporttype);
			map.put("title",title);
			
			LoginDao dao = new LoginDao();
			
			boolean isS = dao.insertBack(map);
			
			if(isS)
			{
				response.sendRedirect("suck.jsp");
			}
			else
			{
				response.sendRedirect("error.jsp");
			}
		}
	}

}
