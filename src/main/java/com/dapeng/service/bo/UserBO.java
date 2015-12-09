/**
 * 
 */
package com.dapeng.service.bo;

import java.util.Date;

/**
 * @author lixf
 *
 */
public class UserBO {
	private int userid ;
	private String username;
	private String password;
	private String sex;
	private Date birthday;
	private String phone;
	private String email;
	private String pswquestion;
	private String pswanswer;
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
