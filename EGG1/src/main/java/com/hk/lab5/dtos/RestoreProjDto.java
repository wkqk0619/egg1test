package com.hk.lab5.dtos;

public class RestoreProjDto {
	private int restorenum;
	private String id;
	private int projnum;
	public int getRestorenum() {
		return restorenum;
	}
	public void setRestorenum(int restorenum) {
		this.restorenum = restorenum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getProjnum() {
		return projnum;
	}
	public void setProjnum(int projnum) {
		this.projnum = projnum;
	}
	@Override
	public String toString() {
		return "RestoreProjDto [restorenum=" + restorenum + ", id=" + id + ", projnum=" + projnum + "]";
	}
	public RestoreProjDto(int restorenum, String id, int projnum) {
		super();
		this.restorenum = restorenum;
		this.id = id;
		this.projnum = projnum;
	}
	public RestoreProjDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
