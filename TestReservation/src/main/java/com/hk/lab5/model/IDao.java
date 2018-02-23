package com.hk.lab5.model;

import java.util.Map;

import com.hk.lab5.dtos.AccountDto;

public interface IDao {

	AccountDto login(Map<String, String> map);
	int emailChk(String email);
	boolean regist(Map<String, String> map);
	int updateFile(AccountDto dto);
	boolean coupon(Map<String, String> map);
	boolean couponChk(String code);
	void couponUse(Map<String, String> map);
	
}
