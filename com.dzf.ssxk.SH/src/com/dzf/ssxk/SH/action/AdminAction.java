package com.dzf.ssxk.SH.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.hibernate.mapping.Map;

import com.dzf.ssxk.SH.model.Admin;
import com.dzf.ssxk.SH.service.Adminfactory;
import com.dzf.ssxk.SH.service.Admininterface;
import com.dzf.ssxk.SH.util.util;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class AdminAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request=ServletActionContext.getRequest();
	private HttpServletResponse response=ServletActionContext.getResponse();
	private Admin admin;
	private String error;
	

	public String Login() throws NoSuchAlgorithmException{
		Admininterface adm=Adminfactory.getInstance();
		Admin ad= adm.Login(admin);		
		if(ad!=null){
			String pwd=util.UseMD5(admin.getPassword());
			if(pwd.equals(ad.getPassword())){
					request.getSession().setAttribute("user", ad);
					return "success";
				}else{
					setError("�������");
					return "error";
				}
			
		}
		setError("�˺Ų�����");
		return "error";
	}
	
	public void Select() throws IOException{
		List<Admin> list=new ArrayList<Admin>();
		Admininterface adm=Adminfactory.getInstance();
		list=adm.select();
		JSONArray json=JSONArray.fromObject(list);
		response.setCharacterEncoding("utf-8");
		PrintWriter pw=response.getWriter();
		pw.write(json.toString());
		pw.close();
		pw.flush();		
	}
	
	public String insert() throws NoSuchAlgorithmException{
		Admininterface adm=Adminfactory.getInstance();
		if(adm.insert(admin)!=null){
			setError("�����ɹ�");
			return "success";
		}
		setError("����ʧ��");
		return "error";
	}
	
	public String update(){
		Admininterface adm=Adminfactory.getInstance();
		if(adm.update(admin)!=null){
			setError("��Ϣ�޸ĳɹ�");
			return "success";
		}
		setError("��Ϣ�޸�ʧ��");
		return "error";
	}
	
	public String pwdupdate() throws NoSuchAlgorithmException{
		Admininterface adm=Adminfactory.getInstance();
		if(adm.pwdupdate()!=null){
			if(adm.pwdupdate().equals(1)){
				setError("�������ԭ����һ��,�޸�ʧ��");
				return "error";
			}else if(adm.pwdupdate().equals(2)){
				setError("���������֤���벻һ��,�޸�ʧ��");
				return "error";
			}
			
		}
		setError("ԭ�������,�޸�ʧ��");
		return error;
		
	}
	
	public String delete(){
		Admininterface adm=Adminfactory.getInstance();
		if(adm.delete()==1){
			setError("ɾ���ɹ�");
			return "success";
		}
		setError("ɾ��ʧ��");
		return "error";
	}
	
	public String pwdrestore() throws NoSuchAlgorithmException{
		Admininterface adm=Adminfactory.getInstance();
		if(adm.pwdrestore()!=null){
			setError("�������óɹ�");
			return "success";
		}
		setError("��������ʧ��");
		return "error";
	}
	

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
	}

	public Admin getAdmin() {
		return admin;
	}

	public void setAdmin(Admin admin) {
		this.admin = admin;
	}
	
	
	

}
