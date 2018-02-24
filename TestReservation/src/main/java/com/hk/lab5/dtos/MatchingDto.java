package com.hk.lab5.dtos;

public class MatchingDto 
{
	private int qseq;
	private String id;
	private char selected;
	public int getQseq() {
		return qseq;
	}
	public void setQseq(int qseq) {
		this.qseq = qseq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public char getSelected() {
		return selected;
	}
	public void setSelected(char selected) {
		this.selected = selected;
	}
	@Override
	public String toString() {
		return "MatchingDto [qseq=" + qseq + ", id=" + id + ", selected=" + selected + "]";
	}
	public MatchingDto(int qseq, String id, char selected) {
		super();
		this.qseq = qseq;
		this.id = id;
		this.selected = selected;
	}
	public MatchingDto() {
		super();
		// TODO Auto-generated constructor stub
	}
}
