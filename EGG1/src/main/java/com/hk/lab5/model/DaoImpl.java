package com.hk.lab5.model;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.lab5.dtos.AccountDto;
import com.hk.lab5.dtos.AnswerDto;
import com.hk.lab5.dtos.MySupportDto;
import com.hk.lab5.dtos.NotionDto;
import com.hk.lab5.dtos.ProjectDto;
import com.hk.lab5.dtos.QnaDto;
import com.hk.lab5.dtos.QuestionDto;
import com.hk.lab5.dtos.SupportDto;

@Repository
public class DaoImpl implements IDao {

	private final String ACCOUNTNAMESPACE = "com.hk.lab5.account.";
	private final String QUESTIONNAMESPACE = "com.hk.lab5.question.";
	private final String NOTIONNAMESPACE = "com.hk.lab5.notion.";
	private final String PROJECTNAMESPACE = "com.hk.lab5.project.";
	private final String QNANAMESPACE = "com.hk.lab5.qna.";
	private final String SUPPORTNAMESPACE = "com.hk.lab5.support.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	// 계정관련
	@Override
	public int emailChk(String email) 
	{
		return sqlSession.selectOne(ACCOUNTNAMESPACE+"idchk", email);
	}

	@Override
	public boolean regist(String email, String pw) 
	{
		Map<String, String> map = new HashMap<String,String>();
		map.put("email", email);
		map.put("pw", pw);
		
		int count = 0;
		
		count = sqlSession.insert(ACCOUNTNAMESPACE+"regist",map);
		
		return count>0?true:false;
	}

	@Override
	public String findpw(String email) 
	{		
		return sqlSession.selectOne(ACCOUNTNAMESPACE+"findpw",email);
	}

	@Override
	public AccountDto login(Map<String, String> map) 
	{
		return sqlSession.selectOne(ACCOUNTNAMESPACE+"login",map);
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


	@Override
	public List<ProjectDto> selectProject(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(PROJECTNAMESPACE+"selectProject",id);
	}


	@Override
	public int insertProject(ProjectDto dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert(PROJECTNAMESPACE+"insertProject",dto);
	}


	@Override
	public ProjectDto ajaxProjDetail(String pseq) {
		// TODO Auto-generated method stub
		List<ProjectDto> list = sqlSession.selectList(PROJECTNAMESPACE+"ajaxProjDetail",pseq);
		return list.get(0);
	}


	@Override
	public int updateProject(ProjectDto dto) {
		// TODO Auto-generated method stub
		return sqlSession.update(PROJECTNAMESPACE+"updateProject",dto);
	}


	@Override
	public int deleteProject(String pseq) {
		// TODO Auto-generated method stub
		return sqlSession.update(PROJECTNAMESPACE+"deleteProject",pseq);
	}

	@Override
	public List<AccountDto> userList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ACCOUNTNAMESPACE+"userList");
	}

	@Override
	public AccountDto ajaxUserDetail(String id) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(ACCOUNTNAMESPACE+"ajaxUserDetail", id);
	}

	@Override
	public boolean updateUser(AccountDto dto) {
		// TODO Auto-generated method stub
		return sqlSession.update(ACCOUNTNAMESPACE+"updateUser",dto)>0?true:false;
	}

	@Override
	public List<QnaDto> qnaList() 
	{
		return sqlSession.selectList(QNANAMESPACE+"qnaListAll");
	}

	@Override
	public List<QnaDto> qnaList(String id) 
	{
		return sqlSession.selectList(QNANAMESPACE+"qnaList",id);
	}

	@Override
	public boolean insertQna(QnaDto dto) 
	{
		return sqlSession.insert(QNANAMESPACE+"insertQna",dto)>0?true:false;
	}

	@Override
	public QnaDto ajaxQnaDetail(String aseq) 
	{
		return sqlSession.selectOne(QNANAMESPACE+"ajaxQnaDetail",aseq);
	}

	@Override
	public boolean deleteQna(String aseq) 
	{
		return sqlSession.delete(QNANAMESPACE+"deleteQna",aseq)>0?true:false;
	}

	@Override
	public boolean updateQna(QnaDto dto) 
	{
		return sqlSession.update(QNANAMESPACE+"updateQna", dto)>0?true:false;
	}

	@Override
	public boolean insertReplyQna(QnaDto dto) 
	{
		return sqlSession.insert(QNANAMESPACE+"insertReplyQna", dto)>0?true:false;
	}

	@Override
	public List<SupportDto> supportList() 
	{
		return sqlSession.selectList(SUPPORTNAMESPACE+"selectList");
	}

	@Override
	public List<QuestionDto> supportQus(String sseq) 
	{
		return sqlSession.selectList(SUPPORTNAMESPACE+"supportQus", sseq);
	}

	@Override
	public void clearSupportQ(String sseq) 
	{
		sqlSession.delete(SUPPORTNAMESPACE+"clearSupportQ", sseq);
	}

	@Override
	public void insertSupportQ(String[] chk,String sseq) 
	{
		List<String> chkList = Arrays.asList(chk);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("chk", chkList);
		map.put("sseq", sseq);
		
		sqlSession.insert(SUPPORTNAMESPACE+"insertSupportQ", map);
	}

	@Override
	public boolean chkMySupport(Map<String, String> map) 
	{
		int count = sqlSession.selectOne(SUPPORTNAMESPACE+"chkMySupport",map);
		return count>0?true:false;
	}
	
	@Override
	public boolean addMySupport(Map<String, String> map) 
	{
		return sqlSession.insert(SUPPORTNAMESPACE+"addMySupport", map)>0?true:false;
	}

	@Override
	public List<SupportDto> mySupportList(String id) 
	{
		return sqlSession.selectList(SUPPORTNAMESPACE+"mySupportList", id);
	}

	@Override
	public boolean delMySupport(Map<String, String> map) 
	{
		return sqlSession.delete(SUPPORTNAMESPACE+"delMySupport", map)>0?true:false;
	}

	@Override
	public boolean upNickName(AccountDto dto) 
	{
		return sqlSession.update(ACCOUNTNAMESPACE+"upNickName", dto)>0?true:false;
	}

	@Override
	public boolean upPassword(AccountDto dto) 
	{
		return sqlSession.update(ACCOUNTNAMESPACE+"upPassword", dto)>0?true:false;
	}

	@Override
	public List<SupportDto> searchSupport(Map<String,String> map) {
		return sqlSession.selectList(SUPPORTNAMESPACE+"searchSupport",map);
	}

	@Override
	public List<AnswerDto> selectAnswer(String pseq) 
	{
		return sqlSession.selectList(PROJECTNAMESPACE+"selectAnswer", pseq);
	}

	@Override
	public void writeAnswer(List<AnswerDto> list) 
	{
		sqlSession.insert(PROJECTNAMESPACE+"writeAnswer",list);
	}

	@Override
	public void clearAnswer(List<AnswerDto> list) 
	{
		sqlSession.delete(PROJECTNAMESPACE+"clearAnswer",list);
	}

	@Override
	public void secession(AccountDto ldto) 
	{
		sqlSession.update(ACCOUNTNAMESPACE+"secession",ldto.getId());
	}

	@Override
	public void recovery(String email) 
	{
		sqlSession.update(ACCOUNTNAMESPACE+"recovery",email);
	}

















	
}
