package models;

public class User implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private String username;
	private String firstname;
	private String lastname;
	private String role;
	
	public User(String username, String firstname, String lastname, String role) {
		setUsername(username);
		setFirstname(firstname);
		setLastname(lastname);
		setRole(role);
	}
	
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getUsername() {
		return username;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", firstname=" + firstname + ", lastname=" + lastname + ", role=" + role
				+ "]";
	}
	
}
