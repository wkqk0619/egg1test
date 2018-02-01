package com.hk.lab5.dtos;

public class AnswerDto 
{
	private int pseq;
	private int qseq;
	private String answer;
	private String id; // 다른테이블 조인용 ANSWER테이블엔 ID가 없다
	private String name; // 마찬가지
	private String question; // 마찬가지
	
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


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getQuestion() {
		return question;
	}

	public AnswerDto(int pseq, int qseq, String answer, String id, String name, String question) {
		super();
		this.pseq = pseq;
		this.qseq = qseq;
		this.answer = answer;
		this.id = id;
		this.name = name;
		this.question = question;
	}


	@Override
	public String toString() {
		return "AnswerDto [pseq=" + pseq + ", qseq=" + qseq + ", answer=" + answer + ", id=" + id + ", name=" + name
				+ ", question=" + question + "]";
	}


	public void setQuestion(String question) {
		this.question = question;
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
