package com.hk.lab5.model;

import java.util.Map;

import com.hk.lab5.dtos.AccountDto;

public interface IDao {

	int emailChk(String email);

	boolean regist(String email, String pw);

	String findpw(String email);

	AccountDto login(Map<String, String> map);

}
