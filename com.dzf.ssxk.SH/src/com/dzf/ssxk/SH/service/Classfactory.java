package com.dzf.ssxk.SH.service;

import com.dzf.ssxk.SH.impl.Classimpl;

public class Classfactory {
	public static Classinterface getInstance(){
		return new Classimpl();
		
	}

}
