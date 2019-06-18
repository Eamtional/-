package com.dzf.ssxk.SH.service;

import com.dzf.ssxk.SH.impl.Adminimpl;

public class Adminfactory{
	
	public static Admininterface getInstance(){
		return new Adminimpl();
		
	}

}
