package models;

public class User implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private String username;
	
	public User(String username) {
		setUsername(username);
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getUsername() {
		return username;
	}
}
