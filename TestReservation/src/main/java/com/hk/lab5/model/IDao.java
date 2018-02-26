package com.hk.lab5.model;

import java.util.List;
import java.util.Map;

import com.hk.lab5.dtos.AccountDto;
import com.hk.lab5.dtos.MatchingDto;
import com.hk.lab5.dtos.NotionDto;
import com.hk.lab5.dtos.QnaDto;
import com.hk.lab5.dtos.QuestDto;
import com.hk.lab5.dtos.ReportDto;
import com.hk.lab5.dtos.WalletlogDto;

public interface IDao {

	AccountDto login(Map<String, String> map);
	int emailChk(String email);
	boolean regist(Map<String, String> map);
	int updateFile(AccountDto dto);
	boolean coupon(Map<String, String> map);
	boolean couponChk(String code);
	void couponUse(Map<String, String> map);
	void insertCouponLog(Map<String, String> map);
	boolean changeInfo(Map<String, String> map);
	List<WalletlogDto> selectWlog(String id);
	Integer makeQCount(String id);
	Integer tryQCount(String id);
	Integer matchingQCount(String id);
	Integer reportCount(String id);
	List<QuestDto> makeQList(String id);
	List<QuestDto> tryQList(String id);
	List<MatchingDto> matchingQList(String id);
	List<ReportDto> reportList(String id);
	List<NotionDto> notionBoard();
	List<QnaDto> qnaBoard(String id);
	NotionDto notionDetail(String nseq);
	
}
