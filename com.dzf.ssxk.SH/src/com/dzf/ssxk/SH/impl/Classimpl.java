package com.dzf.ssxk.SH.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.dzf.ssxk.SH.DAO.HibernateDAO;
import com.dzf.ssxk.SH.DAO.iHibernateDAO;
import com.dzf.ssxk.SH.model.Class;
import com.dzf.ssxk.SH.model.Profession;
import com.dzf.ssxk.SH.service.Classinterface;

public class Classimpl implements Classinterface {
	private iHibernateDAO dao = new HibernateDAO();
	private HttpServletRequest request=ServletActionContext.getRequest();
	private HttpServletResponse response=ServletActionContext.getResponse();


	@Override
	public List<Class> select(String ProfessionID) {
		// TODO Auto-generated method stub
		List<Class> list=new ArrayList<Class>();
		String hql="from Class where ProfessionID=?";
		Object[] parmas={ProfessionID};
		list=dao.select(hql, parmas);
		if(list!=null){
			return list; 
		}
		return null;
	}
	
	@Override
	public List<Class> sel() {
		// TODO Auto-generated method stub
		List<Class> list=new ArrayList<Class>();
		String hql="from Class";
		list=dao.select(hql);
		if(list!=null){
			return list;
		}
		return null;
	}

	@Override
	public Object insert(Class cla) {
		// TODO Auto-generated method stub
		Object obj=null;
		Class cl=(Class) dao.findByID(Class.class, cla.getClassID());
		Profession pro=(Profession) dao.findByID(Profession.class, cla.getProfession().getProfessionID());
		if(cl!=null){
			
			cl.setClassName(cla.getClassName());
			cl.setYearName(cla.getYearName());
			cl.setRemark(cla.getRemark());
			obj=dao.update(cl);
		}else{
			cla.setProfession(pro);
			obj=dao.save(cla);
		}
		
		return obj;
	}

	@Override
	public int delete() {
		// TODO Auto-generated method stub
		int obj=dao.delete(Class.class, request.getParameter("ClassID"));
		return obj;
	}



}
