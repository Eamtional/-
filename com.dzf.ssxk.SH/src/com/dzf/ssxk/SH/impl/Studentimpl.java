package com.dzf.ssxk.SH.impl;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.dzf.ssxk.SH.DAO.HibernateDAO;
import com.dzf.ssxk.SH.DAO.iHibernateDAO;
import com.dzf.ssxk.SH.model.Class;
import com.dzf.ssxk.SH.model.Student;
import com.dzf.ssxk.SH.service.Studentinterface;
import com.dzf.ssxk.SH.util.util;

public class Studentimpl implements Studentinterface {
	private iHibernateDAO dao = new HibernateDAO();
	private HttpServletRequest request=ServletActionContext.getRequest();
	private HttpServletResponse response=ServletActionContext.getResponse();

	@Override
	public List<Student> select(String ClassID) {
		// TODO Auto-generated method stub
		List<Student> list=new ArrayList<Student>();
		String hql="from Student where ClassID=?";
		Object[] parmas={ClassID};
		list=dao.select(hql, parmas);
		if(list!=null){
			return list;
		}
		return null;
	}

	@Override
	public List<Student> select() {
		// TODO Auto-generated method stub
		List<Student> list=new ArrayList<Student>();
		String hql="from Student";
		list=dao.select(hql);
		if(list!=null){
			return list;
		}
		return null;
	}

	@Override
	public Object insert(Student student) throws NoSuchAlgorithmException {
		// TODO Auto-generated method stub
		Object obj=null;
		Student stu=(Student) dao.findByID(Student.class, student.getStudentID());
		Class clas=(Class) dao.findByID(Class.class, student.getClasss().getClassID());
		if(stu!=null){
			stu.setStudentName(student.getStudentName());
			stu.setSex(student.getSex());
			stu.setBirthday(student.getBirthday());
			stu.setFamily(student.getFamily());
			stu.setPassword(student.getPassword());
			stu.setPhoto(student.getPhoto());
			stu.setRemark(student.getRemark());
			
			obj=dao.update(stu);
		}else{
			student.setClasss(clas);
			student.setPassword(util.UseMD5(student.getPassword()));
			obj=dao.save(student);
		}
		return obj;
	}

	@Override
	public int delete() {
		// TODO Auto-generated method stub
		int obj=dao.delete(Student.class, request.getParameter("StudentID"));
		return obj;
	}

}
