package com.dzf.ssxk.SH.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

import org.apache.struts2.ServletActionContext;

import com.dzf.ssxk.SH.model.College;
import com.dzf.ssxk.SH.service.Collegefactory;
import com.dzf.ssxk.SH.service.Collegeinterface;
import com.opensymphony.xwork2.ActionSupport;

public class CollegeAction extends ActionSupport{
	private HttpServletRequest request=ServletActionContext.getRequest();
	private HttpServletResponse response=ServletActionContext.getResponse();
	private String error;
	private College college;
	
	public void select() throws IOException{
		List<College> list=new ArrayList<College>();
		Collegeinterface col=Collegefactory.getInstance();
		list=col.select();
		JsonConfig jsonConfig = new JsonConfig();  //建立配置文件
		jsonConfig.setIgnoreDefaultExcludes(false);  //设置默认忽略
		jsonConfig.setExcludes(new String[]{"department","teacher"});
		JSONArray json=JSONArray.fromObject(list,jsonConfig);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();		
		
	}
	
	public String insert(){
		Collegeinterface col=Collegefactory.getInstance();
		if(col.insert(college)!=null){
			setError("操作成功");
			return "success";
		}
		setError("操作失败");
		return "error";
	}

	public String delete(){
		Collegeinterface col=Collegefactory.getInstance();
		if(col.delete()==1){
			setError("删除成功");
			return "success";
		}
		setError("删除失败");
		return "error";
	}
	
	
	public College getCollege() {
		return college;
	}

	public void setCollege(College college) {
		this.college = college;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}
	
	
	
	
	
	
	
	

}
