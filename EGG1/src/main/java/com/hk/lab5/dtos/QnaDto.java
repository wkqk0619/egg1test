package com.hk.lab5.dtos;

public class QnaDto 
{
	private int aseq;
	private String title;
	private String content;
	private String id;
	private String regdate;
	private int refer;
	private int step;
	private int depth;
	
	public int getAseq() {
		return aseq;
	}
	public void setAseq(int aseq) {
		this.aseq = aseq;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getRefer() {
		return refer;
	}
	public void setRefer(int refer) {
		this.refer = refer;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	public QnaDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public QnaDto(int aseq, String title, String content, String id, String regdate, int refer, int step, int depth) {
		super();
		this.aseq = aseq;
		this.title = title;
		this.content = content;
		this.id = id;
		this.regdate = regdate;
		this.refer = refer;
		this.step = step;
		this.depth = depth;
	}
	@Override
	public String toString() {
		return "QnaDto [aseq=" + aseq + ", title=" + title + ", content=" + content + ", id=" + id + ", regdate="
				+ regdate + ", refer=" + refer + ", step=" + step + ", depth=" + depth + "]";
	}
	
}
