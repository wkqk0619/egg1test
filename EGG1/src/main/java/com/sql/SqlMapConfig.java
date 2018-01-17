package com.sql;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig 
{
	private SqlSessionFactory sqlSessionFactory;
	public SqlSessionFactory getsqlSessionFactory()
	{
		// mybatis를 환경설정하는 과정 (환경설정 파일 지정)
		String resource="com/sql/Configuration.xml";
		try 
		{
			//Configuration.xml정보파일 읽음
			Reader reader=Resources.getResourceAsReader(resource); //Reader는 java.io라 예외처리해야한다.
			//Configuration.xml정보파일 읽은것을 기반으로 팩토리 생성
			sqlSessionFactory=new SqlSessionFactoryBuilder().build(reader);
			reader.close();
		} 
		catch (IOException e) 
		{
			e.printStackTrace();
		}
		
		return sqlSessionFactory;
	}
}
