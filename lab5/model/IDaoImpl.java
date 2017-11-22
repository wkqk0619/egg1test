package com.hk.lab5.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.lab5.dtos.AnswerBoardDto;
import com.hk.lab5.dtos.QuestionDto;

@Repository
public class IDaoImpl implements IDao {
	private final String NAMESPACE="com.hk.lab5.";
	@Autowired
	private SqlSessionTemplate sqlsession;

	@Override
	public List<AnswerBoardDto> selectAllboard() {
		// TODO Auto-generated method stub
		return sqlsession.selectList(NAMESPACE+"selectAllboard");
	}

	
	@Override
	public AnswerBoardDto ajaxDetail(String seq) {
		// TODO Auto-generated method stub
		List<AnswerBoardDto> list = sqlsession.selectList(NAMESPACE+"ajaxDetail",seq);
		return list.get(0);
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

}
