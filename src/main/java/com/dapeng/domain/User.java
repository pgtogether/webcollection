package com.dapeng.domain;
/**
 * 用户类
 * @author Administrator
 *
 */
public class User {
	private String user_id ;
	private String user_name;
	private String user_pwd;
	private String user_email;
	private String user_sex;
	private String birthday;
	private String phone;
	private String pswquestion;
	private String pswanswer;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_sex() {
		return user_sex;
	}
	public void setUser_sex(String user_sex) {
		this.user_sex = user_sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPswquestion() {
		return pswquestion;
	}
	public void setPswquestion(String pswquestion) {
		this.pswquestion = pswquestion;
	}
	public String getPswanswer() {
		return pswanswer;
	}
	public void setPswanswer(String pswanswer) {
		this.pswanswer = pswanswer;
	}

	
}