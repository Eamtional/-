package com.dzf.ssxk.SH.service;

import com.dzf.ssxk.SH.impl.Studentimpl;



public class Studentfactory {
	public static Studentinterface getInstance(){
		return new Studentimpl();
		
	}

}
