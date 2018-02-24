package com.hk.lab5.model;


import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.lab5.dtos.AccountDto;

@Repository
public class DaoImpl implements IDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String ACCOUNTNAMESPACE = "com.hk.lab5.account.";

	@Override
	public AccountDto login(Map<String, String> map) 
	{
		return sqlSession.selectOne(ACCOUNTNAMESPACE+"login",map);
	}
	
	@Override
	public int emailChk(String email) 
	{
		return sqlSession.selectOne(ACCOUNTNAMESPACE+"idchk", email);
	}

	@Override
	public boolean regist(Map<String, String> map) 
	{
		return sqlSession.insert(ACCOUNTNAMESPACE+"regist", map)>0?true:false;
	}

	@Override
	public int updateFile(AccountDto dto) 
	{
		return sqlSession.update(ACCOUNTNAMESPACE+"updateFile", dto);
	}

	@Override
	public boolean coupon(Map<String, String> map) 
	{
		return sqlSession.update(ACCOUNTNAMESPACE+"coupon",map)>0?true:false;
	}

	@Override
	public boolean couponChk(String code) 
	{
		int count = sqlSession.selectOne(ACCOUNTNAMESPACE+"couponChk",code);
		return count>0?true:false;
	}

	@Override
	public void couponUse(Map<String, String> map) 
	{
		sqlSession.update(ACCOUNTNAMESPACE+"couponUse",map);
	}
}
