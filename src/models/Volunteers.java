package models;

public class Volunteers implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	String firstname;
	String lastname;
	int teamID;
	String schoolyear;
	String hometown;
	String highschool;
	String bio;
	String pictureUrl;
	int volID;
	String datetime;
	
	
	public Volunteers(String firstname, String lastname, int teamID, String schoolyear, String hometown,
			String highschool, String bio, String pictureUrl, int volID, String datetime) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.teamID = teamID;
		this.schoolyear = schoolyear;
		this.hometown = hometown;
		this.highschool = highschool;
		this.bio = bio;
		this.pictureUrl = pictureUrl;
		this.volID = volID;
		this.datetime = datetime;
	}


	/**
	 * Constructor for adding a new volunteer.
	 * @param firstname
	 * @param lastname
	 * @param teamID
	 * @param schoolyear
	 * @param hometown
	 * @param highschool
	 * @param bio
	 * @param pictureUrl
	 */
	public Volunteers(String firstname, String lastname, int teamID, String schoolyear, String hometown,
			String highschool, String bio, String pictureUrl) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.teamID = teamID;
		this.schoolyear = schoolyear;
		this.hometown = hometown;
		this.highschool = highschool;
		this.bio = bio;
		this.pictureUrl = pictureUrl;
	}
	
	
	/**
	 * Constructor for statistics
	 * @param firstname
	 * @param lastname
	 * @param teamID
	 * @param volID
	 */
	public Volunteers(String firstname, String lastname, int teamID, int volID) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.teamID = teamID;
		this.volID = volID;
	}



	@Override
	public String toString() {
		return "Volunteers [firstname=" + firstname + ", lastname=" + lastname + ", teamID=" + teamID + ", schoolyear="
				+ schoolyear + ", hometown=" + hometown + ", highschool=" + highschool + ", bio=" + bio
				+ ", pictureUrl=" + pictureUrl + "]";
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
	public int getTeamID() {
		return teamID;
	}
	public void setTeamID(int teamID) {
		this.teamID = teamID;
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
	public String getPictureUrl() {
		return pictureUrl;
	}
	public void setPictureUrl(String pictureUrl) {
		this.pictureUrl = pictureUrl;
	}



	public int getVolID() {
		return volID;
	}



	public void setVolID(int volID) {
		this.volID = volID;
	}	
	
}
