package com.hk.lab5.dtos;

public class DdayDto {
	private String sseq;
	private String title;
	private String dday;
	public String getSseq() {
		return sseq;
	}
	public void setSseq(String sseq) {
		this.sseq = sseq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDday() {
		return dday;
	}
	public void setDday(String dday) {
		this.dday = dday;
	}
	@Override
	public String toString() {
		return "DdayDto [sseq=" + sseq + ", title=" + title + ", dday=" + dday + "]";
	}
	public DdayDto(String sseq, String title, String dday) {
		super();
		this.sseq = sseq;
		this.title = title;
		this.dday = dday;
	}
	public DdayDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
