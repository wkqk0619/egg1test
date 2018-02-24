package com.hk.lab5.dtos;

public class ReportDto 
{
	private int rseq;
	private String id;
	private String targetid;
	private String title;
	private String content;
	private String regdate;
	public int getRseq() {
		return rseq;
	}
	public void setRseq(int rseq) {
		this.rseq = rseq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTargetid() {
		return targetid;
	}
	public void setTargetid(String targetid) {
		this.targetid = targetid;
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
		return "ReportDto [rseq=" + rseq + ", id=" + id + ", targetid=" + targetid + ", title=" + title + ", content="
				+ content + ", regdate=" + regdate + "]";
	}
	public ReportDto(int rseq, String id, String targetid, String title, String content, String regdate) {
		super();
		this.rseq = rseq;
		this.id = id;
		this.targetid = targetid;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
	}
	public ReportDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
