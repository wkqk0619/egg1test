package com.hk.lab5.model;

import java.util.List;
import java.util.Map;

import com.hk.lab5.dtos.AccountDto;
import com.hk.lab5.dtos.AnswerDto;
import com.hk.lab5.dtos.LogDto;
import com.hk.lab5.dtos.MySupportDto;
import com.hk.lab5.dtos.NotionDto;
import com.hk.lab5.dtos.ProjectDto;
import com.hk.lab5.dtos.QnaDto;
import com.hk.lab5.dtos.QuestionDto;
import com.hk.lab5.dtos.RestoreProjDto;
import com.hk.lab5.dtos.SupportDto;

public interface IService {

	boolean emailChk(String email);
	String emailSend(String email, String command);
	boolean regist(String email, String pw);
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
	public List<ProjectDto> selectProject(String id);
	public int insertProject(ProjectDto dto);
	public ProjectDto ajaxProjDetail(String pseq);
	public int updateProject(ProjectDto dto);
	public int deleteProject(String pseq);
	public List<AccountDto> userList();
	public AccountDto ajaxUserDetail(String id);
	public boolean updateUser(AccountDto dto);
	public List<QnaDto> qnaList(AccountDto ldto);
	public boolean insertQna(QnaDto dto);
	public QnaDto ajaxQnaDetail(String aseq);
	public boolean deleteQna(String aseq);
	public boolean updateQna(QnaDto dto);
	public boolean insertReplyQna(QnaDto dto);
	public List<SupportDto> supportList();
	public List<QuestionDto> supportQus(String sseq);
	public void ChangeSupportQ(String sseq, String[] chk);
	public boolean addMySupport(Map<String, String> map);
	public boolean chkMySupport(Map<String, String> map);
	public List<SupportDto> mySupportList(String id);
	public boolean delMySupport(Map<String, String> map);
	public boolean upNickName(AccountDto dto);
	public boolean upPassword(AccountDto dto);
	public List<SupportDto> searchSupport(Map<String,String> map);
	public List<AnswerDto> selectAnswer(String pseq);
	public void writeAnswer(List<AnswerDto> list);
	public void secession(AccountDto ldto);
	public void recovery(String email);
	public void insertLog(String id, String ip, String type);
	public List<LogDto> logList();
	public List<LogDto> myLog(String id);
	public List<LogDto> searchLog(Map<String, String> map);
	public List<RestoreProjDto> selectrestoreproj();
	public int insertRestoreProj(RestoreProjDto dto);
}
