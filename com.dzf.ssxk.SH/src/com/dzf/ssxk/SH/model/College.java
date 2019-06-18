package com.dzf.ssxk.SH.model;

import java.util.HashSet;
import java.util.Set;



public class College {
	private int CollegeID;
	private String CollegeName;
	private String Remark;
	private Set<Department> department;
	private Set<Teacher> teacher;

	
	public Set<Teacher> getTeacher() {
		return teacher;
	}
	public void setTeacher(Set<Teacher> teacher) {
		this.teacher = teacher;
	}
	public Set<Department> getDepartment() {
		return department;
	}
	public void setDepartment(Set<Department> department) {
		this.department = department;
	}
	public int getCollegeID() {
		return CollegeID;
	}
	public void setCollegeID(int collegeID) {
		CollegeID = collegeID;
	}
	public String getCollegeName() {
		return CollegeName;
	}
	public void setCollegeName(String collegeName) {
		CollegeName = collegeName;
	}
	public String getRemark() {
		return Remark;
	}
	public void setRemark(String remark) {
		Remark = remark;
	}
	
	
}
