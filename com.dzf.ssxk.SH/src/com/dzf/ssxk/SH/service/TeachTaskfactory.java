package com.dzf.ssxk.SH.service;

import com.dzf.ssxk.SH.impl.TeachTaskimpl;

public class TeachTaskfactory {
	public static TeachTaskinterface getInstance(){
		return new TeachTaskimpl();
		
	}

}
