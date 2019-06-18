package com.dzf.ssxk.SH.model;

import java.util.Set;

public class Course {
	private String CourseID;
	private String CourseName;
	private String StudyTime;
	private String Crediy;
	private String CurriculumTime;
	private String Remark;
	private Profession profession;
	private Set<TeachTask> teachtask;

	
	public Set<TeachTask> getTeachtask() {
		return teachtask;
	}

	public void setTeachtask(Set<TeachTask> teachtask) {
		this.teachtask = teachtask;
	}

	public String getCourseID() {
		return CourseID;
	}

	public void setCourseID(String courseID) {
		CourseID = courseID;
	}

	public String getRemark() {
		return Remark;
	}

	public void setRemark(String remark) {
		Remark = remark;
	}

	public String getCourseName() {
		return CourseName;
	}

	public void setCourseName(String courseName) {
		CourseName = courseName;
	}

	public String getStudyTime() {
		return StudyTime;
	}

	public void setStudyTime(String studyTime) {
		StudyTime = studyTime;
	}

	public String getCrediy() {
		return Crediy;
	}

	public void setCrediy(String crediy) {
		Crediy = crediy;
	}

	public String getCurriculumTime() {
		return CurriculumTime;
	}

	public void setCurriculumTime(String curriculumTime) {
		CurriculumTime = curriculumTime;
	}

	public Profession getProfession() {
		return profession;
	}

	public void setProfession(Profession profession) {
		this.profession = profession;
	}

}
