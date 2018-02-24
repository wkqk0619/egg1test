package com.hk.lab5.dtos;

public class WalletlogDto 
{
	private String id;
	private String ip;
	private char logtype;
	private int amount;
	private String logtime;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public char getLogtype() {
		return logtype;
	}
	public void setLogtype(char logtype) {
		this.logtype = logtype;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getLogtime() {
		return logtime;
	}
	public void setLogtime(String logtime) {
		this.logtime = logtime;
	}
	@Override
	public String toString() {
		return "WalletlogDto [id=" + id + ", ip=" + ip + ", logtype=" + logtype + ", amount=" + amount + ", logtime="
				+ logtime + "]";
	}
	public WalletlogDto(String id, String ip, char logtype, int amount, String logtime) {
		super();
		this.id = id;
		this.ip = ip;
		this.logtype = logtype;
		this.amount = amount;
		this.logtime = logtime;
	}
	public WalletlogDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
