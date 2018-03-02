package com.hk.lab5.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

//메일서버에게 적합한 계정인지 인증을 받기 위한 class
//메일서버의 smtp를 사용하기 위한 계정을 입력하면 된다.
public class SMTPAuthenticator extends Authenticator {
	protected PasswordAuthentication getPasswordAuthentication() {
		
		
		//사용자에게 메일을 보내야하기 때문에 이메일계정과 비밀번호가 필요하다.
        String username = "dbdudrjs10@daum.net"; // admin mailaddress;
        String password = "amuroray0/*-+";  // password ;
        return new PasswordAuthentication(username, password);
   }
}
