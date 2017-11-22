package com.hk.lab5.model;

public interface IService {

	boolean emailChk(String email);
	String emailSend(String email);
	boolean regist(String email, String pw);

}
