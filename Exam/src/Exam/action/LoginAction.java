package Exam.action;

import com.opensymphony.xwork2.ActionSupport;




public class LoginAction extends ActionSupport {
    private String username;
    private String password;
    private String message;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String execute() {
        System.out.println("��û���ߵ�������");
        String s;
        System.out.println("getUsername():" +getUsername()+ ";password:" + getPassword());
        if (getUsername().equals("admin") && getPassword().equals("a")) {
            System.out.println("�˺�������ȷ��");
            message = "��ӭ��," + username;
            s = "success";
        } else {
            System.out.println("�˺����������");
            message = "�û����������������";
            s = "faile";
        }
        System.out.println("message:" + message);
        return s;
    }
/**
 * Ҫ���ȡaction�еĲ�����������ñ�������get,set����
 * @return
 */
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
