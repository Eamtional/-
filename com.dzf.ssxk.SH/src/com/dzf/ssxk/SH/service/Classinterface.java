package com.dzf.ssxk.SH.service;

import java.util.List;

import com.dzf.ssxk.SH.model.Class;

public interface Classinterface {
	List<Class> select(String ProfessionID);
	List<Class> sel();
	Object insert(Class cla);
	int delete();

}
