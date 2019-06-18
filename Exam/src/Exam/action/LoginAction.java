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
        System.out.println("有没有走到这里来");
        String s;
        System.out.println("getUsername():" +getUsername()+ ";password:" + getPassword());
        if (getUsername().equals("admin") && getPassword().equals("a")) {
            System.out.println("账号密码正确了");
            message = "欢迎您," + username;
            s = "success";
        } else {
            System.out.println("账号密码错误了");
            message = "用户名或密码输入错误";
            s = "faile";
        }
        System.out.println("message:" + message);
        return s;
    }
/**
 * 要想获取action中的参数，必须给该变量设置get,set方法
 * @return
 */
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
