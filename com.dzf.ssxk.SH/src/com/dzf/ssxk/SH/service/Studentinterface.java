package com.dzf.ssxk.SH.service;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import com.dzf.ssxk.SH.model.Student;


public interface Studentinterface {
	List<Student> select(String ClassID);
	List<Student> select();
	Object insert(Student student) throws NoSuchAlgorithmException;
	int delete();

}
