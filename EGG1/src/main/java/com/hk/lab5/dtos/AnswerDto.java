package com.hk.lab5.dtos;

public class AnswerDto 
{
	private int pseq;
	private int qseq;
	private String answer;
	
	public int getPseq() {
		return pseq;
	}
	public void setPseq(int pseq) {
		this.pseq = pseq;
	}
	public int getQseq() {
		return qseq;
	}
	public void setQseq(int qseq) {
		this.qseq = qseq;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	@Override
	public String toString() {
		return "AnswerDto [pseq=" + pseq + ", qseq=" + qseq + ", answer=" + answer + "]";
	}
	public AnswerDto(int pseq, int qseq, String answer) {
		super();
		this.pseq = pseq;
		this.qseq = qseq;
		this.answer = answer;
	}
	public AnswerDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
