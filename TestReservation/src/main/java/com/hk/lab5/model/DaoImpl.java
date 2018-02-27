package com.hk.lab5.model;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hk.lab5.dtos.AccountDto;
import com.hk.lab5.dtos.MatchingDto;
import com.hk.lab5.dtos.NotionDto;
import com.hk.lab5.dtos.QnaDto;
import com.hk.lab5.dtos.QuestDto;
import com.hk.lab5.dtos.ReportDto;
import com.hk.lab5.dtos.WalletlogDto;

@Repository
public class DaoImpl implements IDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private final String ACCOUNTNAMESPACE = "com.hk.lab5.account.";
	private final String QUESTNAMESPACE = "com.hk.lab5.quest.";
	private final String REPORTNAMESPACE = "com.hk.lab5.report.";
	private final String NOTIONNAMESPACE = "com.hk.lab5.notion.";
	private final String QNANAMESPACE = "com.hk.lab5.qna.";

	@Override
	public AccountDto login(Map<String, String> map) 
	{
		return sqlSession.selectOne(ACCOUNTNAMESPACE+"login",map);
	}
	
	@Override
	public int emailChk(String email) 
	{
		return sqlSession.selectOne(ACCOUNTNAMESPACE+"idchk", email);
	}

	@Override
	public boolean regist(Map<String, String> map) 
	{
		return sqlSession.insert(ACCOUNTNAMESPACE+"regist", map)>0?true:false;
	}

	@Override
	public int updateFile(AccountDto dto) 
	{
		return sqlSession.update(ACCOUNTNAMESPACE+"updateFile", dto);
	}

	@Override
	public boolean coupon(Map<String, String> map) 
	{
		return sqlSession.update(ACCOUNTNAMESPACE+"coupon",map)>0?true:false;
	}

	@Override
	public boolean couponChk(String code) 
	{
		int count = sqlSession.selectOne(ACCOUNTNAMESPACE+"couponChk",code);
		return count>0?true:false;
	}

	@Override
	public void couponUse(Map<String, String> map) 
	{
		sqlSession.update(ACCOUNTNAMESPACE+"couponUse",map);
	}

	@Override
	public void insertCouponLog(Map<String, String> map) 
	{
		sqlSession.insert(ACCOUNTNAMESPACE+"insertCouponLog",map);
	}

	@Override
	public boolean changeInfo(Map<String, String> map) 
	{
		return sqlSession.update(ACCOUNTNAMESPACE+"changeInfo",map)>0?true:false;
	}

	@Override
	public List<WalletlogDto> selectWlog(String id) 
	{
		return sqlSession.selectList(ACCOUNTNAMESPACE+"selectWlog", id);
	}

	@Override
	public Integer makeQCount(String id) 
	{
		return sqlSession.selectOne(ACCOUNTNAMESPACE+"makeQCount", id);
	}

	@Override
	public Integer tryQCount(String id) 
	{
		return sqlSession.selectOne(ACCOUNTNAMESPACE+"tryQCount", id);
	}

	@Override
	public Integer matchingQCount(String id) 
	{
		return sqlSession.selectOne(ACCOUNTNAMESPACE+"matchingQCount", id);
	}

	@Override
	public Integer reportCount(String id) 
	{
		return sqlSession.selectOne(ACCOUNTNAMESPACE+"reportCount", id);
	}

	@Override
	public List<QuestDto> makeQList(String id) 
	{
		return sqlSession.selectList(QUESTNAMESPACE+"makeQList",id);
	}

	@Override
	public List<QuestDto> tryQList(String id) 
	{
		return sqlSession.selectList(QUESTNAMESPACE+"tryQList",id);
	}

	@Override
	public List<MatchingDto> matchingQList(String id) 
	{
		return sqlSession.selectList(QUESTNAMESPACE+"matchingQList",id);
	}

	@Override
	public List<ReportDto> reportList(String id) 
	{
		return sqlSession.selectList(REPORTNAMESPACE+"reportList",id);
	}

	@Override
	public List<NotionDto> notionBoard() 
	{
		return sqlSession.selectList(NOTIONNAMESPACE+"notionBoard");
	}

	@Override
	public List<QnaDto> qnaBoard(String id) 
	{
		return sqlSession.selectList(QNANAMESPACE+"qnaBoard",id);
	}

	@Override
	public NotionDto notionDetail(String nseq) 
	{
		return sqlSession.selectOne(NOTIONNAMESPACE+"notionDetail",nseq);
	}
	
	
}
