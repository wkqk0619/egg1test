package com.hk.lab5.dtos;

public class ProjectDto {
	private int pseq;
	private String id;
	private String name;
	private String typeclass;
	private String info;
	private String delflag;
	public ProjectDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ProjectDto(int pseq, String id, String name, String typeclass, String info, String delflag) {
		super();
		this.pseq = pseq;
		this.id = id;
		this.name = name;
		this.typeclass = typeclass;
		this.info = info;
		this.delflag = delflag;
	}
	public int getPseq() {
		return pseq;
	}
	public void setPseq(int pseq) {
		this.pseq = pseq;
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
	public String getTypeclass() {
		return typeclass;
	}
	public void setTypeclass(String typeclass) {
		this.typeclass = typeclass;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public String getDelflag() {
		return delflag;
	}
	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}
	@Override
	public String toString() {
		return "ProjectDto [pseq=" + pseq + ", id=" + id + ", name=" + name + ", typeclass=" + typeclass + ", info="
				+ info + ", delflag=" + delflag + "]";
	}
	
	
}
