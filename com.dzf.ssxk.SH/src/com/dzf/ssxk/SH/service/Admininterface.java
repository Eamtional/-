package com.dzf.ssxk.SH.service;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import com.dzf.ssxk.SH.model.Admin;

public interface Admininterface {
	Admin Login(Admin ad) throws NoSuchAlgorithmException;
	List<Admin> select() throws IOException;
	Object insert(Admin ad) throws NoSuchAlgorithmException;
	Object update(Admin ad);
	Object pwdupdate() throws NoSuchAlgorithmException;
	int delete();
	Object pwdrestore() throws NoSuchAlgorithmException;
}
