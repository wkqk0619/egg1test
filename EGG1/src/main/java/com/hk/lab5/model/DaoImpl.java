package com.hk.lab5.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.lab5.dtos.AccountDto;
import com.hk.lab5.dtos.NotionDto;
import com.hk.lab5.dtos.QuestionDto;

@Repository
public class DaoImpl implements IDao {

	private final String LOGINNAMESPACE = "com.hk.lab5.login.";
	private final String QUESTIONNAMESPACE = "com.hk.lab5.question.";
	private final String NOTIONNAMESPACE = "com.hk.lab5.notion.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 계정관련
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

	@Override
	public AccountDto login(Map<String, String> map) 
	{
		return sqlSession.selectOne(LOGINNAMESPACE+"login",map);
	}

	// 질문관련
	@Override
	public List<QuestionDto> selectQuestion() 
	{
		return sqlSession.selectList(QUESTIONNAMESPACE+"selectQuestion");
	}


	@Override
	public int InsertQuestion(String question) 
	{
		return sqlSession.insert(QUESTIONNAMESPACE+"insertQuestion", question);
	}


	@Override
	public List<QuestionDto> searchInfo(String question) 
	{
		return sqlSession.selectList(QUESTIONNAMESPACE+"searchInfo", question);
	}


	@Override
	public int deleteQuestion(int qseq) 
	{
		return sqlSession.delete(QUESTIONNAMESPACE+"deleteQuestion", qseq);
	}


	// 공지관련
	@Override
	public List<NotionDto> selectNotion() 
	{
		return sqlSession.selectList(NOTIONNAMESPACE+"selectNotion");
	}


	@Override
	public NotionDto ajaxNotionDetail(String nseq) 
	{
		List<NotionDto> list = sqlSession.selectList(NOTIONNAMESPACE+"ajaxNotionDetail",nseq);
		return list.get(0);
	}


	@Override
	public int delNot(int nseq) 
	{
		return sqlSession.delete(NOTIONNAMESPACE+"delNot",nseq);
	}


	@Override
	public int insertNot(NotionDto dto) 
	{
		return sqlSession.insert(NOTIONNAMESPACE+"insertNot",dto);
	}


	@Override
	public int updateNot(NotionDto dto) 
	{
		return sqlSession.update(NOTIONNAMESPACE+"updateNot",dto);
	}
	
}
