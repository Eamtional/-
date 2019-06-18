package com.dzf.ssxk.SH.model;

import java.util.Set;

public class Teacher {
	private String TeacherID;
	private String TeacherName;
	private String Sex;
	private String Birthday;
	private String Kulture;
	private String Home;
	private String Photo;
	private String Password;
	private String Remark;
	private College college;
	private Set<TeachTask> teachtask;
	
	
	public Set<TeachTask> getTeachtask() {
		return teachtask;
	}
	public void setTeachtask(Set<TeachTask> teachtask) {
		this.teachtask = teachtask;
	}
	public String getTeacherID() {
		return TeacherID;
	}
	public void setTeacherID(String teacherID) {
		TeacherID = teacherID;
	}
	
	public String getTeacherName() {
		return TeacherName;
	}
	public void setTeacherName(String teacherName) {
		TeacherName = teacherName;
	}
	public String getSex() {
		return Sex;
	}
	public void setSex(String sex) {
		Sex = sex;
	}
	public String getBirthday() {
		return Birthday;
	}
	public void setBirthday(String birthday) {
		Birthday = birthday;
	}
	public String getKulture() {
		return Kulture;
	}
	public void setKulture(String kulture) {
		Kulture = kulture;
	}
	public String getHome() {
		return Home;
	}
	public void setHome(String home) {
		Home = home;
	}
	public String getPhoto() {
		return Photo;
	}
	public void setPhoto(String photo) {
		Photo = photo;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getRemark() {
		return Remark;
	}
	public void setRemark(String remark) {
		Remark = remark;
	}
	public College getCollege() {
		return college;
	}
	public void setCollege(College college) {
		this.college = college;
	}
	
	
}
