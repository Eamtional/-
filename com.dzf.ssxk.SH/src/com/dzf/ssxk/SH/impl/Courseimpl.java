package com.dzf.ssxk.SH.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.dzf.ssxk.SH.DAO.HibernateDAO;
import com.dzf.ssxk.SH.DAO.iHibernateDAO;
import com.dzf.ssxk.SH.model.Class;
import com.dzf.ssxk.SH.model.Course;
import com.dzf.ssxk.SH.model.Department;
import com.dzf.ssxk.SH.model.Profession;
import com.dzf.ssxk.SH.service.Courseinterface;

public class Courseimpl implements Courseinterface {
	private iHibernateDAO dao = new HibernateDAO();
	private HttpServletRequest request=ServletActionContext.getRequest();
	private HttpServletResponse response=ServletActionContext.getResponse();

	@Override
	public List<Course> select(String ProfessionID) {
		// TODO Auto-generated method stub
		List<Course> list=new ArrayList<Course>();
		String hql="from Course where ProfessionID=?";
		Object[] parmas={ProfessionID};
		list=dao.select(hql, parmas);
		if(list!=null){
			return list;
		}
		return null;
	}
	
	@Override
	public List<Course> select() {
		// TODO Auto-generated method stub
		List<Course> list=new ArrayList<Course>();
		String hql="from Course";
		list=dao.select(hql);
		if(list!=null){
			return list;
		}
		return null;
	}

	@Override
	public Object insert(Course course) {
		// TODO Auto-generated method stub
		Object obj=null;
		Course cou=(Course) dao.findByID(Course.class, course.getCourseID());
		Profession pro=(Profession) dao.findByID(Profession.class, course.getProfession().getProfessionID());
		if(cou!=null){
		
			cou.setCourseName(course.getCourseName());
			cou.setCrediy(course.getCrediy());
			cou.setCurriculumTime(course.getCurriculumTime());
			cou.setStudyTime(course.getStudyTime());
			cou.setRemark(course.getRemark());
			obj=dao.update(cou);
		}else{
			course.setProfession(pro);
			obj=dao.save(course);
		}
		return obj;
	}

	@Override
	public int delete() {
		// TODO Auto-generated method stub
		int obj=dao.delete(Course.class, request.getParameter("CourseID"));
		return obj;
	}


}
