package Spring.action;

import Spring.bean.User;

public class UserAction {
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
	public void print(){
		System.out.print(user.getID());
		
	}

}
