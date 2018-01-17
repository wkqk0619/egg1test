package com.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.sql.SqlMapConfig;

public class LoginDao extends SqlMapConfig
{
	private String loginNamespace = "com.login.";

	public boolean insertBack(Map<String, String[]> map) 
	{
		int count=0;
		
		SqlSession sqlSession = null;
		
		try 
		{
			String[] areaname=map.get("areaname");
			String[] biztitle=map.get("biztitle");
			String[] detailurl=map.get("detailurl");
			String[] enddate=map.get("enddate");
			String[] insertdate=map.get("insertdate");
			String[] organizationname=map.get("organizationname");
			String[] posttarget=map.get("posttarget");
			String[] posttargetage=map.get("posttargetage");
			String[] posttargetcomage=map.get("posttargetcomage");
			String[] startdate=map.get("startdate");
			String[] supporttype=map.get("supporttype");
			String[] title=map.get("title");
			
			sqlSession=getsqlSessionFactory().openSession(false);
			
			Map<String,String> map2 = new HashMap<String,String>();
			
			for(int i = 0 ; i < areaname.length ; i++)
			{
				map2.clear();
				
				map2.put("areaname",areaname[i]);
				map2.put("biztitle",biztitle[i]);
				map2.put("detailurl",detailurl[i]);
				map2.put("enddate",enddate[i]);
				map2.put("insertdate",insertdate[i]);
				map2.put("organizationname",organizationname[i]);
				map2.put("posttarget",posttarget[i]);
				map2.put("posttargetage",posttargetage[i]);
				map2.put("posttargetcomage",posttargetcomage[i]);
				map2.put("startdate",startdate[i]);
				map2.put("supporttype",supporttype[i]);
				map2.put("title",title[i]);
				
				count = sqlSession.insert(loginNamespace+"insertback",map2);
			}

			sqlSession.commit();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
			sqlSession.rollback();
		}
		finally 
		{
			sqlSession.close();
		}
		
		return count>0?true:false;
	}
	
	
	
}
