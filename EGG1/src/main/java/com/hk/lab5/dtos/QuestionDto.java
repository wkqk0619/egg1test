package com.hk.lab5.dtos;

public class QuestionDto {
	private int qseq;
	private String qname;
	
	public QuestionDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QuestionDto(int qseq, String qname) {
		super();
		this.qseq = qseq;
		this.qname = qname;
	}
	public int getQseq() {
		return qseq;
	}
	public void setQseq(int qseq) {
		this.qseq = qseq;
	}
	public String getQname() {
		return qname;
	}
	public void setQname(String qname) {
		this.qname = qname;
	}
	
	@Override
	public String toString() {
		return "QuestionDto [qseq=" + qseq + ", qname=" + qname + "]";
	}
	
	
}
