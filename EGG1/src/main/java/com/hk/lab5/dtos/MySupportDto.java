package com.hk.lab5.dtos;

public class MySupportDto 
{
	private String id;
	private int sseq;
	
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
	@Override
	public String toString() {
		return "MySupportDto [id=" + id + ", sseq=" + sseq + "]";
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
