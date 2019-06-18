package com.dzf.ssxk.SH.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.apache.struts2.ServletActionContext;

import com.dzf.ssxk.SH.model.Course;
import com.dzf.ssxk.SH.service.Coursefactory;
import com.dzf.ssxk.SH.service.Courseinterface;
import com.opensymphony.xwork2.ActionSupport;

public class CourseAction extends ActionSupport{
	private HttpServletRequest request=ServletActionContext.getRequest();
	private HttpServletResponse response=ServletActionContext.getResponse();
	private String error;
	private Course course;
	
	public void select() throws IOException{
		List<Course> list=new ArrayList<Course>();
		Courseinterface cou=Coursefactory.getInstance();
		list=cou.select(request.getParameter("ProfessionID"));
		JsonConfig jsonConfig = new JsonConfig();  //建立配置文件
		jsonConfig.setIgnoreDefaultExcludes(false);  //设置默认忽略
		jsonConfig.setExcludes(new String[]{"profession","teachtask"});
		JSONArray json=JSONArray.fromObject(list,jsonConfig);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();		
		
	}
	
	public void sel() throws IOException{
		List<Course> list=new ArrayList<Course>();
		Courseinterface cou=Coursefactory.getInstance();
		list=cou.select();
		JsonConfig jsonConfig = new JsonConfig();  //建立配置文件
		jsonConfig.setIgnoreDefaultExcludes(false);  //设置默认忽略
		jsonConfig.setExcludes(new String[]{"profession","teachtask"});
		JSONArray json=JSONArray.fromObject(list,jsonConfig);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();		
		
	}
	
	public String insert(){
		Courseinterface cou=Coursefactory.getInstance();
		if(cou.insert(course)!=null){
			setError("操作成功");
			return "success";
		}
		setError("操作失败");
		return "error";
	}
	
	public String delete(){
		Courseinterface cou=Coursefactory.getInstance();
		if(cou.delete()==1){
			setError("删除成功");
			return "success";
		}
		setError("删除失败");
		return "error";
	}
	

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	

	

}
