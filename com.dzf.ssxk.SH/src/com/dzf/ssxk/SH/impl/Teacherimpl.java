package com.dzf.ssxk.SH.impl;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.dzf.ssxk.SH.DAO.HibernateDAO;
import com.dzf.ssxk.SH.DAO.iHibernateDAO;
import com.dzf.ssxk.SH.model.College;
import com.dzf.ssxk.SH.model.Teacher;
import com.dzf.ssxk.SH.service.Teacherinterface;
import com.dzf.ssxk.SH.util.util;

public class Teacherimpl implements Teacherinterface {
	private iHibernateDAO dao = new HibernateDAO();
	private HttpServletRequest request=ServletActionContext.getRequest();
	private HttpServletResponse response=ServletActionContext.getResponse();
	
	@Override
	public Teacher Login(Teacher teacher) {
		// TODO Auto-generated method stub
		Teacher te=(Teacher) dao.findByID(Teacher.class, teacher.getTeacherID());
		return te;
	}

	@Override
	public List<Teacher> select(String CollegeID) {
		// TODO Auto-generated method stub
		List<Teacher> list=new ArrayList<Teacher>();
		String hql="from Teacher where CollegeID=?";
		Object[] parmas={CollegeID};
		list=dao.select(hql, parmas);
		if(list!=null){
			return list;
		}
		return null;
	}

	@Override
	public List<Teacher> select() {
		// TODO Auto-generated method stub
		List<Teacher> list=new ArrayList<Teacher>();
		String hql="from Teacher";
		list=dao.select(hql);
		if(list!=null){
			return list;
		}
		return null;
	}

	@Override
	public Object insert(Teacher teacher) throws NoSuchAlgorithmException {
		// TODO Auto-generated method stub
		
		Object obj=null;
		Teacher te=(Teacher) dao.findByID(Teacher.class, teacher.getTeacherID());
		College col=(College) dao.findByID(College.class, teacher.getCollege().getCollegeID());
		if(te!=null){
			te.setTeacherName(teacher.getTeacherName());
			te.setSex(teacher.getSex());
			te.setHome(teacher.getHome());
			te.setKulture(teacher.getKulture());
			te.setPassword(teacher.getPassword());
			te.setPhoto(teacher.getPhoto());
			te.setRemark(teacher.getRemark());
			te.setBirthday(teacher.getBirthday());
			obj=dao.update(te);
		}else{
			teacher.setCollege(col);
			teacher.setPassword(util.UseMD5(teacher.getPassword()));
			obj=dao.save(teacher);
		}
		
		return obj;
	}

	@Override 
	public int delete() {
		// TODO Auto-generated method stub
		int obj=dao.delete(Teacher.class, request.getParameter("TeacherID"));
		return obj;
	}


}
