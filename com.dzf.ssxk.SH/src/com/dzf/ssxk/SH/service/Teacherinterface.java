package com.dzf.ssxk.SH.service;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import com.dzf.ssxk.SH.model.Teacher;

public interface Teacherinterface {
	Teacher Login(Teacher teacher);
	List<Teacher> select(String CollegeID);
	List<Teacher> select();
	Object insert(Teacher teacher) throws NoSuchAlgorithmException;
	int delete();

}
