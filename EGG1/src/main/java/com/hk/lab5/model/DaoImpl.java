package com.hk.lab5.model;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.lab5.dtos.AccountDto;

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

	@Override
	public AccountDto login(Map<String, String> map) 
	{
		return sqlSession.selectOne(LOGINNAMESPACE+"login",map);
	}


	

	@Override
	public List<QuestionDto> selectQuestion() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(NAMESPACE+"selectQuestion");
	}


	@Override
	public int InsertQuestion(String qname) {
		// TODO Auto-generated method stub
		return sqlsession.insert(NAMESPACE+"insertQuestion", qname);
	}


	@Override
	public List<QuestionDto> searchInfo(String qname) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(NAMESPACE+"searchInfo", qname);
	}


	@Override
	public int deleteQuestion(int qseq) {
		// TODO Auto-generated method stub
		return sqlsession.delete(NAMESPACE+"deleteQuestion", qseq);
	}


	@Override
	public List<NotionDto> selectNotion() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(NAMESPACE+"selectNotion");
	}


	@Override
	public NotionDto ajaxNotionDetail(String nseq) {
		// TODO Auto-generated method stub
		List<NotionDto> list = sqlsession.selectList(NAMESPACE+"ajaxNotionDetail",nseq);
		return list.get(0);
	}


	@Override
	public int delNot(int nseq) {
		// TODO Auto-generated method stub
		return sqlsession.delete(NAMESPACE+"delNot",nseq);
	}


	@Override
	public int insertNot(NotionDto dto) {
		// TODO Auto-generated method stub
		return sqlsession.insert(NAMESPACE+"insertNot",dto);
	}


	@Override
	public int updateNot(NotionDto dto) {
		// TODO Auto-generated method stub
		return sqlsession.update(NAMESPACE+"updateNot",dto);
	}
	
}
