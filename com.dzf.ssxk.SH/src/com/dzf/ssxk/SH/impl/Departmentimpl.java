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
import com.dzf.ssxk.SH.model.College;
import com.dzf.ssxk.SH.model.Department;
import com.dzf.ssxk.SH.service.Departmentfactory;
import com.dzf.ssxk.SH.service.Departmentinterface;

public class Departmentimpl implements Departmentinterface {
	private iHibernateDAO dao = new HibernateDAO();
	private HttpServletRequest request=ServletActionContext.getRequest();
	private HttpServletResponse response=ServletActionContext.getResponse();
	
	@Override
	public List<Department> select(String CollegeID) {
		// TODO Auto-generated method stub
		List<Department> list=new ArrayList<Department>();
		String hql="from Department where CollegeID=?";
		Object[] parmas={CollegeID};
		list=dao.select(hql, parmas);
		if(list!=null){
			return list;
		}
		return null;
	}
	
	@Override
	public Object insert(Department dep) {
		// TODO Auto-generated method stub
		Object obj=null;
		Department department=(Department)dao.findByID(Department.class, dep.getDepartmentID());
		College col=(College)dao.findByID(College.class, dep.getCollege().getCollegeID());
		if(department!=null){
			
			department.setDepartmentName(dep.getDepartmentName());
			department.setRemark(dep.getRemark());
			obj=dao.update(department);
			
		}else{
			dep.setCollege(col);
			obj=dao.save(dep);
		}
		return obj;
	}

	@Override
	public int delete() {
		// TODO Auto-generated method stub
		int obj=dao.delete(Department.class, request.getParameter("DepartmentID"));
		return obj;
	}


}
