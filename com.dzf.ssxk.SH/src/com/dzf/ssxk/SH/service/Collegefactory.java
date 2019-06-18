package com.dzf.ssxk.SH.service;

import com.dzf.ssxk.SH.impl.Collegeimpl;

public class Collegefactory {
	public static Collegeinterface getInstance(){
		return new Collegeimpl();
		
	}

}
