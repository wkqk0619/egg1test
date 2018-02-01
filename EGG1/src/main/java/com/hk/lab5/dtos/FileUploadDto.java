package com.hk.lab5.dtos;

public class FileUploadDto {
	private String id;
	private String fileurl;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFileurl() {
		return fileurl;
	}
	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}
	@Override
	public String toString() {
		return "FileUplodeDto [id=" + id + ", fileurl=" + fileurl + "]";
	}
	public FileUploadDto(String id, String fileurl) {
		super();
		this.id = id;
		this.fileurl = fileurl;
	}
	public FileUploadDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
