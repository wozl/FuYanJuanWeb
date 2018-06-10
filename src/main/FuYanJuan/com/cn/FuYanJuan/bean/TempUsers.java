package com.cn.FuYanJuan.bean;

public class TempUsers {

	private Integer id;
	private String UserName;
	private String Registration_Time;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return UserName;
	}
	public void setUserName(String userName) {
		UserName = userName;
	}
	public String getRegistration_Time() {
		return Registration_Time;
	}
	public void setRegistration_Time(String registration_Time) {
		Registration_Time = registration_Time;
	}
	@Override
	public String toString() {
		return "TempUsers [id=" + id + ", UserName=" + UserName + ", Registration_Time=" + Registration_Time + "]";
	}
	public TempUsers(Integer id, String userName, String registration_Time) {
		super();
		this.id = id;
		UserName = userName;
		Registration_Time = registration_Time;
	}
	public TempUsers() {
		super();
	}
	
}
