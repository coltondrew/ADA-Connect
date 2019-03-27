package models;

public class Volunteers implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	String firstname;
	String lastname;
	String ID;
	String schoolyear;
	String hometown;
	String highschool;
	String bio;
	String team;
	String pictureUrl;

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
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getSchoolyear() {
		return schoolyear;
	}
	public void setSchoolyear(String schoolyear) {
		this.schoolyear = schoolyear;
	}
	public String getHometown() {
		return hometown;
	}
	public void setHometown(String hometown) {
		this.hometown = hometown;
	}
	public String getHighschool() {
		return highschool;
	}
	public void setHighschool(String highschool) {
		this.highschool = highschool;
	}
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}
	public String getTeam() {
		return team;
	}
	public void setTeam(String team) {
		this.team = team;
	}
	public String getPictureUrl() {
		return pictureUrl;
	}
	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}	
	
	
}
