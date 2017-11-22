package com.hk.lab5.model;

public interface IDao {

	int emailChk(String email);

	boolean regist(String email, String pw);

}
