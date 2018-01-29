package com.hk.lab5.dtos;

public class LogDto 
{
	private String id;
	private String ip;
	private String logTime;
	private String logType;
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
	public String getLogTime() {
		return logTime;
	}
	public void setLogTime(String logTime) {
		this.logTime = logTime;
	}
	public String getLogType() {
		return logType;
	}
	public void setLogType(String logType) {
		this.logType = logType;
	}
	public LogDto(String id, String ip, String logTime, String logType) {
		super();
		this.id = id;
		this.ip = ip;
		this.logTime = logTime;
		this.logType = logType;
	}
	public LogDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "LogDto [id=" + id + ", ip=" + ip + ", logTime=" + logTime + ", logType=" + logType + "]";
	}
	
}
