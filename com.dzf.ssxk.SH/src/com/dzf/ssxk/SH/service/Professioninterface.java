package com.dzf.ssxk.SH.service;

import java.util.List;

import com.dzf.ssxk.SH.model.Profession;

public interface Professioninterface {
	List<Profession> select(String DepartmentID);
	List<Profession> select();
	Object insert(Profession profession);
	int delete();

}
