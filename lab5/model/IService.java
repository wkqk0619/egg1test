package com.hk.lab5.model;

import java.util.List;

import com.hk.lab5.dtos.AnswerBoardDto;
import com.hk.lab5.dtos.QuestionDto;

public interface IService {
	public List<AnswerBoardDto> selectAllboard();
	public AnswerBoardDto ajaxDetail(String seq);
	public List<QuestionDto> selectQuestion();
	public int InsertQuestion(String qname);
	public List<QuestionDto> searchInfo(String qname);
}
