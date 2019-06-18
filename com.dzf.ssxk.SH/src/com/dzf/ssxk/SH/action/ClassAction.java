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

import com.dzf.ssxk.SH.service.Classfactory;
import com.dzf.ssxk.SH.service.Classinterface;
import com.opensymphony.xwork2.ActionSupport;

public class ClassAction extends ActionSupport{
	private HttpServletRequest request=ServletActionContext.getRequest();
	private HttpServletResponse response=ServletActionContext.getResponse();
	private String error;
	private com.dzf.ssxk.SH.model.Class classs;
	
	public void select() throws IOException{
		List<com.dzf.ssxk.SH.model.Class> list=new ArrayList<com.dzf.ssxk.SH.model.Class>();
		Classinterface cla=Classfactory.getInstance();
		list=cla.select(request.getParameter("ProfessionID"));
		JsonConfig jsonConfig = new JsonConfig();  //建立配置文件
		jsonConfig.setIgnoreDefaultExcludes(false);  //设置默认忽略
		jsonConfig.setExcludes(new String[]{"profession","student"});
		JSONArray json=JSONArray.fromObject(list,jsonConfig);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();		
		
	}
	
	public void sel() throws IOException{
		List<com.dzf.ssxk.SH.model.Class> list=new ArrayList<com.dzf.ssxk.SH.model.Class>();
		Classinterface cla=Classfactory.getInstance();
		list=cla.sel();
		JsonConfig jsonConfig = new JsonConfig();  //建立配置文件
		jsonConfig.setIgnoreDefaultExcludes(false);  //设置默认忽略
		jsonConfig.setExcludes(new String[]{"profession","student"});
		JSONArray json=JSONArray.fromObject(list,jsonConfig);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();		
	}
	
	public String insert(){
		Classinterface cla=Classfactory.getInstance();
		if(cla.insert(classs)!=null){
			setError("操作成功");
			return "success";
		}
		setError("操作失败");
		return "error";
	}
	
	public String delete(){
		Classinterface cla=Classfactory.getInstance();
		if(cla.delete()==1){
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

	public com.dzf.ssxk.SH.model.Class getClasss() {
		return classs;
	}

	public void setClasss(com.dzf.ssxk.SH.model.Class classs) {
		this.classs = classs;
	}

	
	

}
