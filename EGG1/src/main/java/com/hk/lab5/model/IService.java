package com.hk.lab5.model;

import java.util.Map;

import com.hk.lab5.dtos.AccountDto;

public interface IService {

	boolean emailChk(String email);
	String emailSend(String email, String command);
	boolean regist(String email, String pw);
	AccountDto login(Map<String, String> map);

}
