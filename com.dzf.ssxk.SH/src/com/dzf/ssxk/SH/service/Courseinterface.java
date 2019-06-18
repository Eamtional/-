package com.dzf.ssxk.SH.service;

import java.util.List;

import com.dzf.ssxk.SH.model.Course;


public interface Courseinterface {
	List<Course> select(String ProfessionID);
	List<Course> select();
	Object insert(Course course);
	int delete();

}
