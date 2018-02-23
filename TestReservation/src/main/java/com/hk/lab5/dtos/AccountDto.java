package com.hk.lab5.dtos;

public class AccountDto 
{
	private String id;
	private String password;
	private String name;
	private int age;
	private char gender;
	private String contact;
	private char enabled;
	private String image;
	private String region;
	private int pay;
	private String category;
	private char notifysetting;
	private String introduction;
	private char sell;
	private String starttime;
	private String endtime;
	private int wallet;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public char getEnabled() {
		return enabled;
	}
	public void setEnabled(char enabled) {
		this.enabled = enabled;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public char getNotifysetting() {
		return notifysetting;
	}
	public void setNotifysetting(char notifysetting) {
		this.notifysetting = notifysetting;
	}
	public String getIntroduction() {
		return introduction;
	}
	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}
	public char getSell() {
		return sell;
	}
	public void setSell(char sell) {
		this.sell = sell;
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
	public int getWallet() {
		return wallet;
	}
	public void setWallet(int wallet) {
		this.wallet = wallet;
	}
	@Override
	public String toString() {
		return "AccountDto [id=" + id + ", password=" + password + ", name=" + name + ", age=" + age + ", gender="
				+ gender + ", contact=" + contact + ", enabled=" + enabled + ", image=" + image + ", region=" + region
				+ ", pay=" + pay + ", category=" + category + ", notifysetting=" + notifysetting + ", introduction="
				+ introduction + ", sell=" + sell + ", starttime=" + starttime + ", endtime=" + endtime + ", wallet="
				+ wallet + "]";
	}
	public AccountDto(String id, String password, String name, int age, char gender, String contact, char enabled,
			String image, String region, int pay, String category, char notifysetting, String introduction, char sell,
			String starttime, String endtime, int wallet) {
		super();
		this.id = id;
		this.password = password;
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.contact = contact;
		this.enabled = enabled;
		this.image = image;
		this.region = region;
		this.pay = pay;
		this.category = category;
		this.notifysetting = notifysetting;
		this.introduction = introduction;
		this.sell = sell;
		this.starttime = starttime;
		this.endtime = endtime;
		this.wallet = wallet;
	}
	public AccountDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
