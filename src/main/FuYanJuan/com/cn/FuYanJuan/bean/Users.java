package com.cn.FuYanJuan.bean;


/**@author LQ &  FuYanJuan
 * 
 * 用户属性类 与数据库用户表字段属性一致 
 *
 */
public class Users {
	
	private Integer id;  //用户表id
	private String UserName;//用户名
	private String PassWord;//密码
	private String Registration_Time;//注册时间
	private Integer isadmin;//是否是管理员
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
	public String getPassWord() {
		return PassWord;
	}
	public void setPassWord(String passWord) {
		PassWord = passWord;
	}
	public String getRegistration_Time() {
		return Registration_Time;
	}
	public void setRegistration_Time(String registration_Time) {
		Registration_Time = registration_Time;
	}
	public Integer getIsadmin() {
		return isadmin;
	}
	public void setIsadmin(Integer isadmin) {
		this.isadmin = isadmin;
	}
	@Override
	public String toString() {
		return "Users [id=" + id + ", UserName=" + UserName + ", PassWord=" + PassWord + ", Registration_Time="
				+ Registration_Time + ", isadmin=" + isadmin + "]";
	}
	public Users(Integer id, String userName, String passWord, String registration_Time, Integer isadmin) {
		super();
		this.id = id;
		UserName = userName;
		PassWord = passWord;
		Registration_Time = registration_Time;
		this.isadmin = isadmin;
	}
	public Users() {
		super();
	}
	
	
}
