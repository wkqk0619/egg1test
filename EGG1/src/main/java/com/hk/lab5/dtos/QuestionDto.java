package com.hk.lab5.dtos;

public class QuestionDto {
	private int qseq;
	private String question;
	public int getQseq() {
		return qseq;
	}
	public void setQseq(int qseq) {
		this.qseq = qseq;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	@Override
	public String toString() {
		return "QuestionDto [qseq=" + qseq + ", question=" + question + "]";
	}
	public QuestionDto(int qseq, String question) {
		super();
		this.qseq = qseq;
		this.question = question;
	}
	public QuestionDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
