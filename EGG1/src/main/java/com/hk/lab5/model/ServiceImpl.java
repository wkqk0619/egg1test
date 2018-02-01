package com.hk.lab5.model;

import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hk.lab5.dtos.AccountDto;
import com.hk.lab5.dtos.AnswerDto;
import com.hk.lab5.dtos.FileUploadDto;
import com.hk.lab5.dtos.LogDto;
import com.hk.lab5.dtos.MySupportDto;
import com.hk.lab5.dtos.NotionDto;
import com.hk.lab5.dtos.ProjectDto;
import com.hk.lab5.dtos.QnaDto;
import com.hk.lab5.dtos.QuestionDto;
import com.hk.lab5.dtos.RestoreProjDto;
import com.hk.lab5.dtos.SupportDto;
import com.hk.lab5.mail.MailSend;

@Service
public class ServiceImpl implements IService {

	@Autowired
	private IDao dao;

	/*
	 * 서비스쪽에서 여러개의 dao 메소드를 호출하니 하나의 dao 메소드는 하나의 쿼리문을 날린다
	 * 트랜잭션은 서비스쪽에서 건다.
	 * @Transactional 트랜잭션 걸기
	 * @Transactional(readOnly=true) : select일 경우(비동기식으로 처리 수정중이건 뭐건 현재의 값을 가져옴)
	 */
	
	// 아이디 중복검사 true = 이미 존재함 false = 없음
	@Override
	public boolean emailChk(String email) 
	{
		int count = dao.emailChk(email);
		
		return count>0?true:false;
	}

	@Override
	public String emailSend(String email,String command) 
	{
		if(command.equals("R"))
		{
			Random random = new Random();
			String content = Long.toHexString(Math.abs(random.nextLong()));	// 이게 바로 난수
			
			String title = "이지지원에 관심을 주셔서 감사합니다.";
			
			MailSend ms = new MailSend();
			
			ms.mailSend(email, title, content);
			
			return content;
		}
		else if(command.equals("P"))
		{
			Random random = new Random();
			String content = Long.toHexString(Math.abs(random.nextLong()));	// 이게 바로 난수
			
			String title = "비밀번호 찾기 인증번호";
			
			MailSend ms = new MailSend();
			
			ms.mailSend(email, title, content);
			
			return content;
		}
		else if(command.equals("F"))
		{
			try 
			{
				MailSend ms = new MailSend();
				String title = "이지지원 계정비밀번호";
				
				String content = dao.findpw(email);
						
				ms.mailSend(email, title, content);
				
				return "S";
			} 
			catch (Exception e) 
			{
				e.printStackTrace();
				return "F";
			}
		}
		else if(command.equals("C"))
		{
			Random random = new Random();
			String content = Long.toHexString(Math.abs(random.nextLong()));	// 이게 바로 난수
			
			String title = "계정 복구용 인증문자";
			
			MailSend ms = new MailSend();
			
			ms.mailSend(email, title, content);
			
			return content;
		}
		
		return "";
	}

	@Override
	public boolean regist(String email, String pw) 
	{
		return dao.regist(email,pw);
	}

	@Override
	public AccountDto login(Map<String, String> map) 
	{
		return dao.login(map);
	}





	//질문가져오기
	@Override
	public List<QuestionDto> selectQuestion() {
		// TODO Auto-generated method stub
		return dao.selectQuestion();
	}

	
	//질문추가하기
	@Override
	public int InsertQuestion(String question) {
		// TODO Auto-generated method stub
		return dao.InsertQuestion(question);
	}


	@Override
	public List<QuestionDto> searchInfo(String question) {
		// TODO Auto-generated method stub
		return dao.searchInfo(question);
	}


	@Override
	public int deleteQuestion(int qseq) {
		// TODO Auto-generated method stub
		return dao.deleteQuestion(qseq);
	}


	@Override
	public List<NotionDto> selectNotion() {
		// TODO Auto-generated method stub
		return dao.selectNotion();
	}


	@Override
	public NotionDto ajaxNotionDetail(String nseq) {
		// TODO Auto-generated method stub
		return dao.ajaxNotionDetail(nseq);
	}


	@Override
	public int delNot(int nseq) {
		// TODO Auto-generated method stub
		return dao.delNot(nseq);
	}


	@Override
	public int insertNot(NotionDto dto) {
		// TODO Auto-generated method stub
		return dao.insertNot(dto);
	}


	@Override
	public int updateNot(NotionDto dto) {
		// TODO Auto-generated method stub
		return dao.updateNot(dto);
	}




	@Override
	public List<ProjectDto> selectProject(String id) {
		// TODO Auto-generated method stub
		return dao.selectProject(id);
	}


	@Override
	public int insertProject(ProjectDto dto) {
		// TODO Auto-generated method stub
		return dao.insertProject(dto);
	}


	@Override
	public ProjectDto ajaxProjDetail(String pseq) {
		// TODO Auto-generated method stub
		return dao.ajaxProjDetail(pseq);
	}


	@Override
	public int updateProject(ProjectDto dto) {
		// TODO Auto-generated method stub
		return dao.updateProject(dto);
	}


	@Override
	public int deleteProject(String pseq) {
		// TODO Auto-generated method stub
		return dao.deleteProject(pseq);
	}

	@Override
	public List<AccountDto> userList() {
		// TODO Auto-generated method stub
		return dao.userList();
	}

	@Override
	public AccountDto ajaxUserDetail(String id) {
		// TODO Auto-generated method stub
		return dao.ajaxUserDetail(id);
	}

	@Override
	public boolean updateUser(AccountDto dto) {
		// TODO Auto-generated method stub
		return dao.updateUser(dto);
	}

	@Override
	public List<QnaDto> qnaList(AccountDto ldto) 
	{
		if(ldto.getRole()=='U')
		{
			return dao.qnaList(ldto.getId());
		}
		else
		{
			return dao.qnaList();
		}
	}

	@Override
	public boolean insertQna(QnaDto dto) 
	{
		return dao.insertQna(dto);
	}

	@Override
	public QnaDto ajaxQnaDetail(String aseq) 
	{
		return dao.ajaxQnaDetail(aseq);
	}

	@Override
	public boolean deleteQna(String aseq) 
	{
		return dao.deleteQna(aseq);
	}

	@Override
	public boolean updateQna(QnaDto dto) 
	{
		return dao.updateQna(dto);
	}

	@Override
	public boolean insertReplyQna(QnaDto dto) {
		return dao.insertReplyQna(dto);
	}

	@Override
	public List<SupportDto> supportList() 
	{
		return dao.supportList();
	}

	@Override
	public List<QuestionDto> supportQus(String sseq) 
	{
		return dao.supportQus(sseq);
	}

	@Override
	@Transactional
	public void ChangeSupportQ(String sseq, String[] chk) 
	{	
		dao.clearSupportQ(sseq);
		
		if(chk!=null)
		{
			dao.insertSupportQ(chk,sseq);
		}
		
	}

	@Override
	public boolean addMySupport(Map<String, String> map) 
	{
		return dao.addMySupport(map);
	}

	@Override
	public boolean chkMySupport(Map<String, String> map) 
	{
		return dao.chkMySupport(map);
	}

	@Override
	public List<SupportDto> mySupportList(String id) 
	{
		return dao.mySupportList(id);
	}

	@Override
	public boolean delMySupport(Map<String, String> map) 
	{
		return dao.delMySupport(map);
	}

	@Override
	public boolean upNickName(AccountDto dto) 
	{
		return dao.upNickName(dto);
	}

	@Override
	public boolean upPassword(AccountDto dto) 
	{
		return dao.upPassword(dto);
	}

	@Override
	public List<SupportDto> searchSupport(Map<String,String> map) 
	{
		return dao.searchSupport(map);
	}

	@Override
	public List<AnswerDto> selectAnswer(String pseq) 
	{
		return dao.selectAnswer(pseq);
	}

	@Override
	@Transactional
	public void writeAnswer(List<AnswerDto> list) 
	{
		dao.clearAnswer(list);
		dao.writeAnswer(list);
	}

	@Override
	public void secession(AccountDto ldto) 
	{
		dao.secession(ldto);
	}

	@Override
	public void recovery(String email) 
	{
		dao.recovery(email);
	}

	@Override
	public void insertLog(String id, String ip, String type) 
	{
		dao.insertLog(id, ip, type);
	}

	@Override
	public List<LogDto> logList() 
	{
		return dao.logList();
	}

	@Override
	public List<LogDto> myLog(String id) 
	{
		return dao.myLog(id);
	}

	@Override
	public List<LogDto> searchLog(Map<String, String> map) 
	{
		return dao.searchLog(map);
	}

	@Override
	public List<AnswerDto> statisticsQus(String qseq) 
	{
		return dao.statisticsQus(qseq);
	}
	
	public List<RestoreProjDto> selectrestoreproj() {
		// TODO Auto-generated method stub
		return dao.selectrestoreproj();
	}

	@Override
	public int insertRestoreProj(RestoreProjDto dto) {
		// TODO Auto-generated method stub
		return dao.insertRestoreProj(dto);
	}

	@Override
	public ProjectDto ajaxProjSelect(ProjectDto dto) {
		// TODO Auto-generated method stub
		return dao.ajaxProjSelect(dto);
	}

	@Override
	public int UpResProject(ProjectDto dto) {
		// TODO Auto-generated method stub
		return dao.UpResProject(dto);
	}

	@Override
	public int deleteRestoreList(RestoreProjDto dto) {
		// TODO Auto-generated method stub
		return dao.deleteRestoreList(dto);
	}

	@Override
	public List<RestoreProjDto> ajaxselectRestoreProj() {
		// TODO Auto-generated method stub
		return dao.ajaxselectRestoreProj();
	}

	@Override
<<<<<<< HEAD
	public FileUploadDto selectUserFile(FileUploadDto dto) {
		// TODO Auto-generated method stub
		return dao.selectUserFile(dto);
	}

	@Override
	public int insertFileUpload(FileUploadDto dto) {
		// TODO Auto-generated method stub
		return dao.insertFileUpload(dto);
	}

	@Override
	public int updateFile(AccountDto dto) {
		// TODO Auto-generated method stub
		return dao.updateFile(dto);
=======
	public List<AnswerDto> userAllAnswer(String id) 
	{
		return dao.userAllAnswer(id);
>>>>>>> b8299a062ff60799cb85244641221b8497ce0c8a
	}

}




