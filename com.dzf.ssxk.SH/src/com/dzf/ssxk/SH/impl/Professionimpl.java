package com.dzf.ssxk.SH.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.dzf.ssxk.SH.DAO.HibernateDAO;
import com.dzf.ssxk.SH.DAO.iHibernateDAO;
import com.dzf.ssxk.SH.model.Department;
import com.dzf.ssxk.SH.model.Profession;
import com.dzf.ssxk.SH.service.Professioninterface;

public class Professionimpl implements Professioninterface {
	private iHibernateDAO dao = new HibernateDAO();
	private HttpServletRequest request=ServletActionContext.getRequest();
	private HttpServletResponse response=ServletActionContext.getResponse();
	
	@Override
	public List<Profession> select(String DepartmentID) {
		// TODO Auto-generated method stub
		List<Profession> list=new ArrayList<Profession>();
		String hql="from Profession where DepartmentID=?";
		Object[] parmas={DepartmentID};
		list=dao.select(hql, parmas);
		if(list!=null){
			return list;
		}
		return null;
	}
	
	@Override
	public List<Profession> select() {
		// TODO Auto-generated method stub
		List<Profession> list=new ArrayList<Profession>();
		String hql="from Profession";
		list=dao.select(hql);
		if(list!=null){
			return list;
		}
		return null;
	}


	/*@Override
	public Object insert(Profession pro) {
		// TODO Auto-generated method stub
		Object obj=null;
		Profession pr=(Profession) dao.findByID(Profession.class, pro.getProfessionID());
		Department dep=(Department) dao.findByID(Department.class, pro.getDepartment().getDepartmentID());
		if(pr!=null){
		
			pr.setProfessionName(pro.getProfessionName());
			pr.setRemark(pro.getRemark());
			obj=dao.update(pr);
		}else{
			pro.setDepartment(dep);
			obj=dao.save(pro);
		}
		return obj;
	}*/


	@Override
	public int delete() {
		// TODO Auto-generated method stub
		int obj=dao.delete(Profession.class, request.getParameter("ProfessionID"));
		return obj;
	}

	@Override
	public Object insert(Profession profession) {
		// TODO Auto-generated method stub
		Object obj=null;
		Profession pr=(Profession) dao.findByID(Profession.class, profession.getProfessionID());
		Department dep=(Department) dao.findByID(Department.class, profession.getDepartment().getDepartmentID());
		if(pr!=null){
			pr.setProfessionName(profession.getProfessionName());
			pr.setRemark(profession.getRemark());
			obj=dao.update(pr);
		}else{
			profession.setDepartment(dep);
			obj=dao.save(profession);
		}
		return obj;
	}


	

}
