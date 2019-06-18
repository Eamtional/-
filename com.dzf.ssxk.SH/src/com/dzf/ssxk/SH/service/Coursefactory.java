package com.dzf.ssxk.SH.service;

import com.dzf.ssxk.SH.impl.Courseimpl;

public class Coursefactory {
	public static Courseinterface getInstance(){
		return new Courseimpl();
	}

}
