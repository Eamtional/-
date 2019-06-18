package com.dzf.ssxk.SH.impl;

import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.dzf.ssxk.SH.DAO.HibernateDAO;
import com.dzf.ssxk.SH.DAO.iHibernateDAO;
import com.dzf.ssxk.SH.model.Course;
import com.dzf.ssxk.SH.model.TeachTask;
import com.dzf.ssxk.SH.model.Teacher;
import com.dzf.ssxk.SH.service.TeachTaskinterface;

public class TeachTaskimpl implements TeachTaskinterface {
	private iHibernateDAO dao = new HibernateDAO();
	private HttpServletRequest request=ServletActionContext.getRequest();
	private HttpServletResponse response=ServletActionContext.getResponse();
	
	@Override
	public List<TeachTask> select(String CourseID) {
		// TODO Auto-generated method stub
		List<TeachTask> list=new ArrayList<TeachTask>();
		String hql="from TeachTask where CourseID=?";
		Object[] parmas={CourseID};
		list=dao.select(hql, parmas);
		if(list!=null){
			return list;
		}
		return null;
	}
	
	
	@Override
	public List<TeachTask> sele(String TeacherID) {
		// TODO Auto-generated method stub
		List<TeachTask> list=new ArrayList<TeachTask>();
		String hql="from TeachTask where TeacherID=?";
		Object[] parmas={TeacherID};
		list=dao.select(hql, parmas);
		if(list!=null){
			return list;
		}
		return null;
	}

	@Override
	public List<TeachTask> select() {
		// TODO Auto-generated method stub
		List<TeachTask> list=new ArrayList<TeachTask>();
		String hql="from TeachTask";
		list=dao.select(hql);
		if(list!=null){
			return list;
		}
		return null;
	}

	@Override
	public Object insert(TeachTask teachTask) throws NoSuchAlgorithmException {
		// TODO Auto-generated method stub
		Object obj=null;
		Course cou=(Course) dao.findByID(Course.class, request.getParameter("CourseID"));
		Teacher te=(Teacher) dao.findByID(Teacher.class,  request.getParameter("TeacherID"));
		TeachTask tea=new TeachTask();
		/*tea.setCourse(cou);*/
		tea.setPerson(te.getTeacherName());
		tea.setCourse(cou.getCourseName());
		/*tea.setTeacher(te);*/
		obj=dao.save(tea);
		
		return obj;
	}
	
	
	/*@Override
	public Object insert() {
		// TODO Auto-generated method stub
		Object obj=null;
		Course cou=(Course) dao.findByID(Course.class, request.getParameter("CourseID"));
		Teacher te=(Teacher) dao.findByID(Teacher.class,  request.getParameter("TeacherID"));
		TeachTask tea=new TeachTask();
		tea.setCourse(cou.getCourseName());
		tea.setCurricula(request.getParameter("Curricula"));
		tea.setPerson(te.getTeacherName());
		tea.setCourse(cou);
		tea.setTeacher(te);
		obj=dao.save(tea);
		
		return obj;
	}
	@Override
	public Object ins(TeachTask teachTask) {
		// TODO Auto-generated method stub
		Object obj=null;
		Course cou=(Course) dao.findByID(Course.class, request.getParameter("CourseID"));
		Teacher te=(Teacher) dao.findByID(Teacher.class,  request.getParameter("TeacherID"));
		TeachTask tea=new TeachTask();
		tea.setCourse(cou.getCourseName());
		tea.setCurricula(request.getParameter(""));
		tea.setPerson(te.getTeacherName());
		tea.setCourse(cou);
		tea.setTeacher(te);
		obj=dao.save(tea);
		
		return obj;
	}
*/

	@Override
	public int delete() {
		// TODO Auto-generated method stub
		int obj=dao.delete(TeachTask.class, request.getParameter("TeachTaskID"));
		return obj;
	}


	






}
