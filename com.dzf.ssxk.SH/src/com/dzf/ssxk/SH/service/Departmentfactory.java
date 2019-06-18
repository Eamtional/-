package com.dzf.ssxk.SH.service;

import com.dzf.ssxk.SH.impl.Departmentimpl;

public class Departmentfactory {
	public static Departmentinterface getInstance(){
		return new Departmentimpl();
		
	}

}
