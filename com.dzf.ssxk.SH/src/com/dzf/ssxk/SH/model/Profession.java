package com.dzf.ssxk.SH.model;

import java.util.Set;

public class Profession {
	private String ProfessionID;
	private String ProfessionName;
	private String Remark;
	private Department department;
	private Set<Class> classs;
	private Set<Course> course;
	
	
	public Set<Course> getCourse() {
		return course;
	}
	public void setCourse(Set<Course> course) {
		this.course = course;
	}
	public Set<Class> getClasss() {
		return classs;
	}
	public void setClasss(Set<Class> classs) {
		this.classs = classs;
	}
	public String getProfessionID() {
		return ProfessionID;
	}
	public void setProfessionID(String professionID) {
		ProfessionID = professionID;
	}
	public String getProfessionName() {
		return ProfessionName;
	}
	public void setProfessionName(String professionName) {
		ProfessionName = professionName;
	}
	public String getRemark() {
		return Remark;
	}
	public void setRemark(String remark) {
		Remark = remark;
	}
	public Department getDepartment() {
		return department;
	}
	public void setDepartment(Department department) {
		this.department = department;
	}
	
	
	
	
}
