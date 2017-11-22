package com.hk.lab5.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hk.lab5.dtos.AnswerBoardDto;
import com.hk.lab5.dtos.QuestionDto;

@Service
public class ServiceImpl implements IService {
	
	@Autowired
	private IDao dao;

	//전체글 가져오기
	@Override
	public List<AnswerBoardDto> selectAllboard() {
		// TODO Auto-generated method stub
		return dao.selectAllboard();
	}

	
	//상세글 가져오기
	@Override
	public AnswerBoardDto ajaxDetail(String seq) {
		// TODO Auto-generated method stub
		return dao.ajaxDetail(seq);
	}


	//질문가져오기
	@Override
	public List<QuestionDto> selectQuestion() {
		// TODO Auto-generated method stub
		return dao.selectQuestion();
	}

	
	
	//질문추가하기
	@Override
	public int InsertQuestion(String qname) {
		// TODO Auto-generated method stub
		return dao.InsertQuestion(qname);
	}


	@Override
	public List<QuestionDto> searchInfo(String qname) {
		// TODO Auto-generated method stub
		return dao.searchInfo(qname);
	}
	
	
	

}
