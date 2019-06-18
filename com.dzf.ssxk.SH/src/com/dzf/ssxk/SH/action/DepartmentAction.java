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

import com.dzf.ssxk.SH.model.Department;
import com.dzf.ssxk.SH.service.Departmentfactory;
import com.dzf.ssxk.SH.service.Departmentinterface;
import com.opensymphony.xwork2.ActionSupport;

public class DepartmentAction extends ActionSupport{
	private HttpServletRequest request=ServletActionContext.getRequest();
	private HttpServletResponse response=ServletActionContext.getResponse();
	private String error;
	private Department department;
	
	public void select() throws IOException{
		List<Department> list=new ArrayList<Department>();
		Departmentinterface dep=Departmentfactory.getInstance();
		list=dep.select(request.getParameter("CollegeID"));
		JsonConfig jsonConfig = new JsonConfig();  //���������ļ�
		jsonConfig.setIgnoreDefaultExcludes(false);  //����Ĭ�Ϻ���
		jsonConfig.setExcludes(new String[]{"college","profession"});
		JSONArray json=JSONArray.fromObject(list,jsonConfig);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();		
		
	}
	
	public String insert(){
	Departmentinterface dep=Departmentfactory.getInstance();
		if(dep.insert(department)!=null){
			setError("�����ɹ�");
			return "success";
		}
		setError("����ʧ��");
		return "error";
	}
	
	public String delete(){
		Departmentinterface dep=Departmentfactory.getInstance();
		if(dep.delete()==1){
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

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}
	
	

}
