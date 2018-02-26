package com.hk.lab5.dtos;

public class NotionDto 
{
	private int nseq;
	private String title;
	private String content;
	private String regdate;
	
	public int getNseq() {
		return nseq;
	}
	public void setNseq(int nseq) {
		this.nseq = nseq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	@Override
	public String toString() {
		return "NotionDto [nseq=" + nseq + ", title=" + title + ", content=" + content + ", regdate=" + regdate + "]";
	}
	public NotionDto(int nseq, String title, String content, String regdate) {
		super();
		this.nseq = nseq;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}
	public NotionDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
