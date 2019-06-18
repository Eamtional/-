package com.dzf.ssxk.SH.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;

import org.apache.struts2.ServletActionContext;

import com.dzf.ssxk.SH.model.TeachTask;
import com.dzf.ssxk.SH.service.TeachTaskfactory;
import com.dzf.ssxk.SH.service.TeachTaskinterface;
import com.dzf.ssxk.SH.service.Teacherfactory;
import com.opensymphony.xwork2.ActionSupport;

public class TeachTaskAction extends ActionSupport{
	private HttpServletRequest request=ServletActionContext.getRequest();
	private HttpServletResponse response=ServletActionContext.getResponse();
	private String error;
	private TeachTask teachTask;
	
	public void select() throws IOException{
		List<TeachTask> list=new ArrayList<TeachTask>();
		TeachTaskinterface tea=TeachTaskfactory.getInstance();
		list=tea.select(request.getParameter("CourseID"));
		JsonConfig jsonConfig = new JsonConfig();  //建立配置文件
		jsonConfig.setIgnoreDefaultExcludes(false);  //设置默认忽略
		jsonConfig.setExcludes(new String[]{"teacher","course"});
		JSONArray json=JSONArray.fromObject(list,jsonConfig);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();		
		
	}
	
	public void sele() throws IOException{
		List<TeachTask> list=new ArrayList<TeachTask>();
		TeachTaskinterface tea=TeachTaskfactory.getInstance();
		list=tea.sele(request.getParameter("TeacherID"));
		JsonConfig jsonConfig = new JsonConfig();  //建立配置文件
		jsonConfig.setIgnoreDefaultExcludes(false);  //设置默认忽略
		jsonConfig.setExcludes(new String[]{"teacher","teachTask"});
		JSONArray json=JSONArray.fromObject(list,jsonConfig);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();		
		
	}
	 
	/*查询Profession所有信息*/
	public void sel() throws IOException{
		List<TeachTask> list=new ArrayList<TeachTask>();
		TeachTaskinterface tea=TeachTaskfactory.getInstance();
		list=tea.select();
		JsonConfig jsonConfig = new JsonConfig();  //建立配置文件
		jsonConfig.setIgnoreDefaultExcludes(false);  //设置默认忽略
		jsonConfig.setExcludes(new String[]{"teacher","course"});
		JSONArray json=JSONArray.fromObject(list,jsonConfig);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();		
	}
	
	public String inse() throws NoSuchAlgorithmException{
		TeachTaskinterface tea=TeachTaskfactory.getInstance();
		if(tea.insert(teachTask)!=null){
			setError("操作成功");
			return "success";
		}
		setError("操作失败");
		return "error";
	}
	
	public String insert() throws NoSuchAlgorithmException{
		TeachTaskinterface tea=TeachTaskfactory.getInstance();
		if(tea.insert(teachTask)!=null){
			setError("操作成功");
			return "success";
		}
		setError("操作失败");
		return "error";
	}
	
	public String delete(){
		TeachTaskinterface tea=TeachTaskfactory.getInstance();
		if(tea.delete()==1){
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

	public TeachTask getTeachTask() {
		return teachTask;
	}

	public void setTeachTask(TeachTask teachTask) {
		this.teachTask = teachTask;
	}

	

}
