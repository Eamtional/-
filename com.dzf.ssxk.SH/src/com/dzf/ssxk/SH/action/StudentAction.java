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

import com.dzf.ssxk.SH.model.Student;
import com.dzf.ssxk.SH.service.Studentfactory;
import com.dzf.ssxk.SH.service.Studentinterface;
import com.opensymphony.xwork2.ActionSupport;

public class StudentAction extends ActionSupport{
	private HttpServletRequest request=ServletActionContext.getRequest();
	private HttpServletResponse response=ServletActionContext.getResponse();
	private String error;
	private Student student;
	
	public void select() throws IOException{
		List<Student> list=new ArrayList<Student>();
		Studentinterface stu=Studentfactory.getInstance();
		list=stu.select(request.getParameter("ClassID"));
		JsonConfig jsonConfig = new JsonConfig();  //���������ļ�
		jsonConfig.setIgnoreDefaultExcludes(false);  //����Ĭ�Ϻ���
		jsonConfig.setExcludes(new String[]{"classs"});
		JSONArray json=JSONArray.fromObject(list,jsonConfig);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();		
		
	}
	
	/*��ѯProfession������Ϣ*/
	public void sel() throws IOException{
		List<Student> list=new ArrayList<Student>();
		Studentinterface stu=Studentfactory.getInstance();
		list=stu.select();
		JsonConfig jsonConfig = new JsonConfig();  //���������ļ�
		jsonConfig.setIgnoreDefaultExcludes(false);  //����Ĭ�Ϻ���
		jsonConfig.setExcludes(new String[]{"classs"});
		JSONArray json=JSONArray.fromObject(list,jsonConfig);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();		
	}
	
	public String insert() throws NoSuchAlgorithmException{
		Studentinterface stu=Studentfactory.getInstance();
		if(stu.insert(student)!=null){
			setError("�����ɹ�");
			return "success";
		}
		setError("����ʧ��");
		return "error";
	}
	
	public String delete(){
		Studentinterface stu=Studentfactory.getInstance();
		if(stu.delete()==1){
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

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	

	
	

}
