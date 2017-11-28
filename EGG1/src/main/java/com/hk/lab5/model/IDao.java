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
	public int InsertQuestion(String question);
	public List<QuestionDto> searchInfo(String question);
	public int deleteQuestion(int qseq);
	public List<NotionDto> selectNotion();
	public NotionDto ajaxNotionDetail(String nseq);
	public int delNot(int nseq);
	public int insertNot(NotionDto dto);
	public int updateNot(NotionDto dto);
	public List<ProjectDto> selectProject();
	public int insertProject(ProjectDto dto);
	public ProjectDto ajaxProjDetail(String pseq);
	public int updateProject(ProjectDto dto);
	public int deleteProject(String pseq);

}
