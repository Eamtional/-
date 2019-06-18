package com.dzf.ssxk.SH.service;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import com.dzf.ssxk.SH.model.TeachTask;


public interface TeachTaskinterface {
	List<TeachTask> select(String CourseID);
	List<TeachTask> sele(String TeacherID);
	List<TeachTask> select();
	Object insert(TeachTask teachTask) throws NoSuchAlgorithmException;
	int delete();

}
