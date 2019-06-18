package Spring.demo;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import Spring.action.UserAction;

public class text {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext text=new ClassPathXmlApplicationContext("beans.xml");
		UserAction us=(UserAction)text.getBean("userAction");
		us.print();
	}

}
