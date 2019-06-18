package com.dzf.ssxk.SH.service;

import java.util.List;

import com.dzf.ssxk.SH.model.Department;

public interface Departmentinterface {
	List<Department> select(String CollegeID);
	Object insert(Department dep);
	int delete();

}
