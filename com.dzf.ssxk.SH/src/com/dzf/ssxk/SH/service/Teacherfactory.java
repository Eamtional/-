package com.dzf.ssxk.SH.service;

import com.dzf.ssxk.SH.impl.Teacherimpl;


public class Teacherfactory {
	public static Teacherinterface getInstance(){
		return new Teacherimpl();
		
	}

}
