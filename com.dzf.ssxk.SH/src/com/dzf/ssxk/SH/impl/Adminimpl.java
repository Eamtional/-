package com.dzf.ssxk.SH.impl;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import net.sf.json.JSONArray;

import com.dzf.ssxk.SH.DAO.HibernateDAO;
import com.dzf.ssxk.SH.DAO.iHibernateDAO;
import com.dzf.ssxk.SH.model.Admin;
import com.dzf.ssxk.SH.service.Adminfactory;
import com.dzf.ssxk.SH.service.Admininterface;
import com.dzf.ssxk.SH.util.util;


public class Adminimpl implements Admininterface {
	private iHibernateDAO dao = new HibernateDAO();
	private HttpServletRequest request=ServletActionContext.getRequest();
	
	
	@Override
	public Admin Login(Admin ad) throws NoSuchAlgorithmException {
		// TODO Auto-generated method stub
		Admin admin=(Admin)dao.findByID(Admin.class, ad.getAdminID());
		return admin;
	}

	@Override
	public List<Admin> select() throws IOException {
		// TODO Auto-generated method stub
		List<Admin> list=new ArrayList<Admin>();
		String hql="from Admin";
		list=dao.select(hql);
		if(list!=null){
			return list;
		}
		return null;
	}
	
	@Override
	public Object insert(Admin ad) throws NoSuchAlgorithmException {
		// TODO Auto-generated method stub
		Object obj =null;
		Admin upAdmin=(Admin)dao.findByID(Admin.class, ad.getAdminID());
		if(upAdmin!=null){
			upAdmin.setAdminName(ad.getAdminName());
			upAdmin.setPassword(ad.getPassword());
			upAdmin.setRole(ad.getRole());
			upAdmin.setPhoto(ad.getPhoto());
			upAdmin.setRemark(ad.getRemark());
			obj = dao.update(upAdmin);
		}else{
			ad.setPassword(util.UseMD5(ad.getPassword()));
			obj = dao.save(ad);
			
		}
		return obj;
		
	}
	
	@Override
	public int delete() {
		// TODO Auto-generated method stub

		int  obj=dao.delete(Admin.class,request.getParameter("AdminID") );
		return obj;
	}

	@Override
	public Object update(Admin ad) {
		// TODO Auto-generated method stub
		Object obj=null;
		Admin upAdmin=(Admin)dao.findByID(Admin.class, ad.getAdminID());
		if(upAdmin!=null){
		upAdmin.setAdminName(ad.getAdminName());
		upAdmin.setRemark(ad.getRemark());
		obj=dao.update(upAdmin);
		}
		return obj;
	}

	@Override
	public Object pwdupdate() throws NoSuchAlgorithmException {
		// TODO Auto-generated method stub
		Object obj=null;
		String old=request.getParameter("Oldpwd");//原密码
		String newpwd=request.getParameter("Newpwd");//新密码
		String newpwd_t=request.getParameter("Newpwd_t");//确认密码
		String old_t=util.UseMD5(old);
		
		Admin upAdmin=(Admin)dao.findByID(Admin.class, request.getParameter("old_t"));
		if(upAdmin!=null){//原密码和输入密码是否一致
				if(newpwd.equals(newpwd_t)){//新密码和验证密码一致
					if(!newpwd_t.equals(old)){//新密码和原密码是否一致
						/*String newpwd_w=util.UseMD5(newpwd);*/
						upAdmin.setPassword(util.UseMD5(newpwd));
						obj=dao.update(upAdmin);
						
						return obj;
					}else{
						return obj=1;//新密码和原密码一致
					}
					
				}else{
					return obj=2;//新密码和验证密码不一致
				}
		}
		return obj;
		
	}

	@Override
	public Object pwdrestore() throws NoSuchAlgorithmException {
		// TODO Auto-generated method stub
		Object obj=null;
		Admin upAdmin=(Admin)dao.findByID(Admin.class,request.getParameter("AdminID"));
		if(upAdmin!=null){
		upAdmin.setPassword(util.UseMD5("123456"));
		obj=dao.update(upAdmin);
		}
		return obj;
	}



	
	
}
