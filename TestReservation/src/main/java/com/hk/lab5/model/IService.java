package com.hk.lab5.model;

import java.util.Map;

import com.hk.lab5.dtos.AccountDto;

public interface IService 
{
	AccountDto login(Map<String, String> map);
	boolean emailChk(String email);
	String emailSend(String email, String command);
	boolean regist(Map<String, String> map);
	int updateFile(AccountDto dto);
	boolean coupon(Map<String, String> map);
	boolean couponChk(String code);

}
