package com.hk.lab5.dtos;

public class AccountDto 
{
	private String id;
	private String password;
	private String regdate;
	private char role;
	private char enabled;
	private String nickname;
	private String icon;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public char getRole() {
		return role;
	}
	public void setRole(char role) {
		this.role = role;
	}
	public char getEnabled() {
		return enabled;
	}
	public void setEnabled(char enabled) {
		this.enabled = enabled;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	@Override
	public String toString() {
		return "AccountDto [id=" + id + ", password=" + password + ", regdate=" + regdate + ", role=" + role
				+ ", enabled=" + enabled + ", nickname=" + nickname + ", icon=" + icon + "]";
	}
	public AccountDto(String id, String password, String regdate, char role, char enabled, String nickname,
			String icon) {
		super();
		this.id = id;
		this.password = password;
		this.regdate = regdate;
		this.role = role;
		this.enabled = enabled;
		this.nickname = nickname;
		this.icon = icon;
	}
	public AccountDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
