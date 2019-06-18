package com.dzf.ssxk.SH.model;

import java.security.NoSuchAlgorithmException;

import com.dzf.ssxk.SH.util.util;

public class Admin {
	
	private String AdminID;
	private String AdminName;
	private String Role;
	private String Password;
	private String Photo;
	private String Remark;
	
	
	public String getAdminID() {
		return AdminID;
	}
	public void setAdminID(String adminID) {
		AdminID = adminID;
	}
	public String getAdminName() {
		return AdminName;
	}
	public void setAdminName(String adminName) {
		AdminName = adminName;
	}
	public String getRole() {
		return Role;
	}
	public void setRole(String role) {
		Role = role;
	}
	public String getPassword() {
		return Password; 
	}
	public void setPassword(String password) {
			Password = password;
	}
	public String getPhoto() {
		return Photo;
	}
	public void setPhoto(String photo) {
		Photo = photo;
	}
	public String getRemark() {
		return Remark;
	}
	public void setRemark(String remark) {
		Remark = remark;
	}
	
	
	

}
