package com.dzf.ssxk.SH.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.dzf.ssxk.SH.DAO.HibernateDAO;
import com.dzf.ssxk.SH.DAO.iHibernateDAO;
import com.dzf.ssxk.SH.model.College;
import com.dzf.ssxk.SH.service.Collegefactory;
import com.dzf.ssxk.SH.service.Collegeinterface;

public class Collegeimpl implements Collegeinterface {
	private iHibernateDAO dao = new HibernateDAO();
	private HttpServletRequest request=ServletActionContext.getRequest();
	private HttpServletResponse response=ServletActionContext.getResponse();

	@Override
	public List<College> select(){
		// TODO Auto-generated method stub
		List<College> list=new ArrayList<College>();
		String hql="from College";
		list=dao.select(hql);
		if(list!=null){
			return list;
		}
		return null;
	}

	@Override
	public Object insert(College co) {
		// TODO Auto-generated method stub
		Object obj=null;
		College col=(College)dao.findByID(College.class, co.getCollegeID());
		if(col!=null){
			
			col.setCollegeName(co.getCollegeName());
			col.setRemark(co.getRemark());
			obj=dao.update(col);
		}else{
			obj=dao.save(co);
		}
		return obj;
	}

	@Override
	public int delete() {
		// TODO Auto-generated method stub
		int obj=dao.delete(College.class, Integer.valueOf(request.getParameter("CollegeID")));
		return obj;
	}
	
}
