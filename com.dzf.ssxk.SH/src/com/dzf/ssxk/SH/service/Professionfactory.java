package com.dzf.ssxk.SH.service;

import com.dzf.ssxk.SH.impl.Professionimpl;

public class Professionfactory {
	public static Professioninterface getInstance(){
		return new Professionimpl();
		
	}

}
