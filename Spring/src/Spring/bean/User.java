package Spring.bean;

public class User {
	private String ID;
	private String Name;
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	
	public User(String ID,String Name){
		super();
		this.ID=ID;
		this.Name=Name;
	}

	
}
