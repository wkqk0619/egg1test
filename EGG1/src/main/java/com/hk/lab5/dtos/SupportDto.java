package com.hk.lab5.dtos;

public class SupportDto 
{
	private int sseq;
	private String title;
	private String type;
	private String area;
	private String biztitle;
	private String url;
	private String regdate;
	private String startdate;
	private String enddate;
	private String sgroup;
	private String target;
	private String targetage;
	private String targetcareer;
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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getBiztitle() {
		return biztitle;
	}
	public void setBiztitle(String biztitle) {
		this.biztitle = biztitle;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
	public String getEnddate() {
		return enddate;
	}
	public void setEnddate(String enddate) {
		this.enddate = enddate;
	}
	public String getSgroup() {
		return sgroup;
	}
	public void setSgroup(String sgroup) {
		this.sgroup = sgroup;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getTargetage() {
		return targetage;
	}
	public void setTargetage(String targetage) {
		this.targetage = targetage;
	}
	public String getTargetcareer() {
		return targetcareer;
	}
	public void setTargetcareer(String targetcareer) {
		this.targetcareer = targetcareer;
	}
	@Override
	public String toString() {
		return "SupportDto [sseq=" + sseq + ", title=" + title + ", type=" + type + ", area=" + area + ", biztitle="
				+ biztitle + ", url=" + url + ", regdate=" + regdate + ", startdate=" + startdate + ", enddate="
				+ enddate + ", sgroup=" + sgroup + ", target=" + target + ", targetage=" + targetage + ", targetcareer="
				+ targetcareer + "]";
	}
	public SupportDto(int sseq, String title, String type, String area, String biztitle, String url, String regdate,
			String startdate, String enddate, String sgroup, String target, String targetage, String targetcareer) {
		super();
		this.sseq = sseq;
		this.title = title;
		this.type = type;
		this.area = area;
		this.biztitle = biztitle;
		this.url = url;
		this.regdate = regdate;
		this.startdate = startdate;
		this.enddate = enddate;
		this.sgroup = sgroup;
		this.target = target;
		this.targetage = targetage;
		this.targetcareer = targetcareer;
	}
	public SupportDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	
}
