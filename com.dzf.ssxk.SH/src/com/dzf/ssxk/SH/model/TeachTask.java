package com.dzf.ssxk.SH.model;

public class TeachTask {
	private int TeachTaskID;
	private String Auditing;
	private String Person;
	private String Remark;
	private String Course;
	private Teacher teacher;
	private Course course;
	
	public int getTeachTaskID() {
		return TeachTaskID;
	}
	public void setTeachTaskID(int teachTaskID) {
		TeachTaskID = teachTaskID;
	}
	public String getAuditing() {
		return Auditing;
	}
	public void setAuditing(String auditing) {
		Auditing = auditing;
	}
	public String getPerson() {
		return Person;
	}
	public void setPerson(String person) {
		Person = person;
	}
	public String getRemark() {
		return Remark;
	}
	public void setRemark(String remark) {
		Remark = remark;
	}
	
	public void setCourse(String course) {
		Course = course;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public Course getCourse() {
		return course;
	}
	public void setCourse(Course course) {
		this.course = course;
	}
	
	
	

}
