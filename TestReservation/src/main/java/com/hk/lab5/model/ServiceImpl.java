package com.hk.lab5.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hk.lab5.dtos.AccountDto;
import com.hk.lab5.dtos.MatchingDto;
import com.hk.lab5.dtos.NotionDto;
import com.hk.lab5.dtos.QnaDto;
import com.hk.lab5.dtos.QuestDto;
import com.hk.lab5.dtos.ReportDto;
import com.hk.lab5.dtos.WalletlogDto;
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
	
	@Override
	public AccountDto login(Map<String, String> map) 
	{
		return dao.login(map);
	}
	
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
			
			String title = "시간거래소에 관심을 주셔서 감사합니다.";
			
			MailSend ms = new MailSend();
			
			ms.mailSend(email, title, content);
			
			return content;
		}
			
		return "";
	}

	@Override
	public boolean regist(Map<String, String> map) 
	{
		return dao.regist(map);
	}

	@Override
	public int updateFile(AccountDto dto) 
	{
		return dao.updateFile(dto);
	}

	@Override
	@Transactional
	public boolean coupon(Map<String, String> map) 
	{
		dao.couponUse(map);
		return dao.coupon(map);
	}

	@Override
	public boolean couponChk(String code) 
	{
		return dao.couponChk(code);
	}

	@Override
	public void insertCouponLog(Map<String,String> map) 
	{
		dao.insertCouponLog(map);
	}

	@Override
	public boolean changeInfo(Map<String, String> map) 
	{
		return dao.changeInfo(map);
	}

	@Override
	public List<WalletlogDto> selectWlog(String id) 
	{
		return dao.selectWlog(id);
	}

	@Override
	public Map<String, Integer> countMyList(String id) 
	{
		Map<String, Integer> map = new HashMap<String,Integer>();
		
		map.put("makeQ", dao.makeQCount(id));
		map.put("tryQ", dao.tryQCount(id));
		map.put("matchingQ", dao.matchingQCount(id));
		map.put("report", dao.reportCount(id));
		
		return map;
	}

	@Override
	public List<QuestDto> makeQList(String id) 
	{
		return dao.makeQList(id);
	}

	@Override
	public List<QuestDto> tryQList(String id) 
	{
		return dao.tryQList(id);
	}

	@Override
	public List<MatchingDto> matchingQList(String id) 
	{
		return dao.matchingQList(id);
	}

	@Override
	public List<ReportDto> reportList(String id) 
	{
		return dao.reportList(id);
	}

	@Override
	public List<NotionDto> notionBoard() 
	{
		return dao.notionBoard();
	}

	@Override
	public List<QnaDto> qnaBoard(String id)
	{
		return dao.qnaBoard(id);
	}

	@Override
	public NotionDto notionDetail(String nseq) 
	{
		return dao.notionDetail(nseq);
	}

}




