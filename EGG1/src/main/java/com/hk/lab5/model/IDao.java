package com.hk.lab5.model;

import java.util.List;
import java.util.Map;

import com.hk.lab5.dtos.AccountDto;
import com.hk.lab5.dtos.NotionDto;
import com.hk.lab5.dtos.QuestionDto;

public interface IDao {

	int emailChk(String email);

	boolean regist(String email, String pw);

	String findpw(String email);

	AccountDto login(Map<String, String> map);

	public List<QuestionDto> selectQuestion();
	public int InsertQuestion(String qname);
	public List<QuestionDto> searchInfo(String qname);
	public int deleteQuestion(int qseq);
	public List<NotionDto> selectNotion();
	public NotionDto ajaxNotionDetail(String nseq);
	public int delNot(int nseq);
	public int insertNot(NotionDto dto);
	public int updateNot(NotionDto dto);

}
