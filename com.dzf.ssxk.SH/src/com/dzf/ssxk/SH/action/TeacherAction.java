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

import com.dzf.ssxk.SH.model.Teacher;
import com.dzf.ssxk.SH.service.Teacherfactory;
import com.dzf.ssxk.SH.service.Teacherinterface;
import com.dzf.ssxk.SH.util.util;
import com.opensymphony.xwork2.ActionSupport;

public class TeacherAction extends ActionSupport{
	private HttpServletRequest request=ServletActionContext.getRequest();
	private HttpServletResponse response=ServletActionContext.getResponse();
	private String error;
	private Teacher teacher;
	
	public String Login() throws NoSuchAlgorithmException{
		Teacherinterface tea=Teacherfactory.getInstance();
		Teacher te=tea.Login(teacher);
		if(te!=null){
			String pwd=util.UseMD5(teacher.getPassword());
			if(pwd.equals(te.getPassword())){
				request.getSession().setAttribute("teacher", te);
				return "success";
			}else{
				setError("�������");
				return "error";
			}
		}
		setError("�˺Ų�����");
		return "error";
	}
	
	public void select() throws IOException{
		List<Teacher> list=new ArrayList<Teacher>();
		Teacherinterface tea=Teacherfactory.getInstance();
		list=tea.select(request.getParameter("CollegeID"));
		JsonConfig jsonConfig = new JsonConfig();  //���������ļ�
		jsonConfig.setIgnoreDefaultExcludes(false);  //����Ĭ�Ϻ���
		jsonConfig.setExcludes(new String[]{"department","college"});
		JSONArray json=JSONArray.fromObject(list,jsonConfig);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();		
		
	}
	
	/*��ѯProfession������Ϣ*/
	public void sel() throws IOException{
		List<Teacher> list=new ArrayList<Teacher>();
		Teacherinterface tea=Teacherfactory.getInstance();
		list=tea.select();
		JsonConfig jsonConfig = new JsonConfig();  //���������ļ�
		jsonConfig.setIgnoreDefaultExcludes(false);  //����Ĭ�Ϻ���
		jsonConfig.setExcludes(new String[]{"department","college"});
		JSONArray json=JSONArray.fromObject(list,jsonConfig);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();		
	}
	
	public String insert() throws NoSuchAlgorithmException{
		Teacherinterface tea=Teacherfactory.getInstance();
		if(tea.insert(teacher)!=null){
			setError("�����ɹ�");
			return "success";
		}
		setError("����ʧ��");
		return "error";
	}
	
	public String delete(){
		Teacherinterface tea=Teacherfactory.getInstance();
		if(tea.delete()==1){
			setError("ɾ���ɹ�");
			return "success";
		}
		setError("ɾ��ʧ��");
		return "error";
	}
	

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	
	

}
