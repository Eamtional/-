package com.dzf.ssxk.SH.service;

import java.util.List;

import com.dzf.ssxk.SH.model.College;

public interface Collegeinterface {
	List<College> select();
	Object insert(College co);
	int delete();

}
