package com.hk.lab5.dtos;

public class QuestDto 
{
	private int qseq;
	private String id;
	private String title;
	private String type;
	private String content;
	private int persons;
	private int pay;
	private char phase;
	private String locaddress;
	private String latlng;
	private char gender;
	private char age;
	private String starttime;
	private String endtime;
	private char quickmatch;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getPersons() {
		return persons;
	}
	public void setPersons(int persons) {
		this.persons = persons;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public char getPhase() {
		return phase;
	}
	public void setPhase(char phase) {
		this.phase = phase;
	}
	public String getLocaddress() {
		return locaddress;
	}
	public void setLocaddress(String locaddress) {
		this.locaddress = locaddress;
	}
	public String getLatlng() {
		return latlng;
	}
	public void setLatlng(String latlng) {
		this.latlng = latlng;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public char getAge() {
		return age;
	}
	public void setAge(char age) {
		this.age = age;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public char getQuickmatch() {
		return quickmatch;
	}
	public void setQuickmatch(char quickmatch) {
		this.quickmatch = quickmatch;
	}
	@Override
	public String toString() {
		return "QuestDto [qseq=" + qseq + ", id=" + id + ", title=" + title + ", type=" + type + ", content=" + content
				+ ", persons=" + persons + ", pay=" + pay + ", phase=" + phase + ", locaddress=" + locaddress
				+ ", latlng=" + latlng + ", gender=" + gender + ", age=" + age + ", starttime=" + starttime
				+ ", endtime=" + endtime + ", quickmatch=" + quickmatch + "]";
	}
	public QuestDto(int qseq, String id, String title, String type, String content, int persons, int pay, char phase,
			String locaddress, String latlng, char gender, char age, String starttime, String endtime,
			char quickmatch) {
		super();
		this.qseq = qseq;
		this.id = id;
		this.title = title;
		this.type = type;
		this.content = content;
		this.persons = persons;
		this.pay = pay;
		this.phase = phase;
		this.locaddress = locaddress;
		this.latlng = latlng;
		this.gender = gender;
		this.age = age;
		this.starttime = starttime;
		this.endtime = endtime;
		this.quickmatch = quickmatch;
	}
	public QuestDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
