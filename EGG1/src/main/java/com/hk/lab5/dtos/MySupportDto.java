package com.hk.lab5.dtos;

public class MySupportDto 
{
	private String id;
	private int sseq;
	private String title; // MYSUPPORT테이블엔 title이 없다

	@Override
	public String toString() {
		return "MySupportDto [id=" + id + ", sseq=" + sseq + ", title=" + title + "]";
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getSseq() {
		return sseq;
	}
	public void setSseq(int sseq) {
		this.sseq = sseq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public MySupportDto(String id, int sseq) {
		super();
		this.id = id;
		this.sseq = sseq;
	}
	public MySupportDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
