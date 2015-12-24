package com.dapeng.service.bo;

import java.util.Date;


/**
 *	意见 
 * @author lixf
 *
 */
public class IdeaBO {
	String userid;
	String ideatitle;
	String ideacontent;
	Date ideatime;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getIdeatitle() {
		return ideatitle;
	}
	public void setIdeatitle(String ideatitle) {
		this.ideatitle = ideatitle;
	}
	public String getIdeacontent() {
		return ideacontent;
	}
	public void setIdeacontent(String ideacontent) {
		this.ideacontent = ideacontent;
	}
	public Date getIdeatime() {
		return ideatime;
	}
	public void setIdeatime(Date ideatime) {
		this.ideatime = ideatime;
	}
	
	

}
