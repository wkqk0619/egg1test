package com.hk.lab5.model;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DaoImpl implements IDao {

	private final String LOGINNAMESPACE = "com.hk.lab5.login.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int emailChk(String email) 
	{
		return sqlSession.selectOne(LOGINNAMESPACE+"idchk", email);
	}

	@Override
	public boolean regist(String email, String pw) 
	{
		Map<String, String> map = new HashMap<String,String>();
		map.put("email", email);
		map.put("pw", pw);
		
		int count = 0;
		
		count = sqlSession.insert(LOGINNAMESPACE+"regist",map);
		
		return count>0?true:false;
	}

	@Override
	public String findpw(String email) 
	{		
		return sqlSession.selectOne(LOGINNAMESPACE+"findpw",email);
	}
	
}
