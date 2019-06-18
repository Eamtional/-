package com.dzf.ssxk.SH.model;

import java.util.Set;

public class Department {
	private String DepartmentID;
	private String DepartmentName;
	private String Remark;
	private College college;
	private Set<Profession> profession;

	public College getCollege() {
		return college;
	}

	public void setCollege(College college) {
		this.college = college;
	}

	public String getDepartmentID() {
		return DepartmentID;
	}

	public void setDepartmentID(String departmentID) {
		DepartmentID = departmentID;
	}

	public String getDepartmentName() {
		return DepartmentName;
	}

	public void setDepartmentName(String departmentName) {
		DepartmentName = departmentName;
	}

	public String getRemark() {
		return Remark;
	}

	public void setRemark(String remark) {
		Remark = remark;
	}

	public Set<Profession> getProfession() {
		return profession;
	}

	public void setProfession(Set<Profession> profession) {
		this.profession = profession;
	}
	
	
	
	

}
