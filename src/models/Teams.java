package models;

public class Teams implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	String teamname;
	int ID;
	String username;
	double latitude;
	double longitude;
	String photoUrl;
	
	
	
	public Teams(String teamname, int iD) {
		super();
		this.teamname = teamname;
		ID = iD;
	}
	public Teams(String teamname, String username, double latitude, double longitude, String photoUrl) {
		super();
		this.teamname = teamname;
		this.username = username;
		this.latitude = latitude;
		this.longitude = longitude;
		this.photoUrl = photoUrl;
	}
	public String getTeamname() {
		return teamname;
	}
	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	
	public String getPhotoUrl() {
		return photoUrl;
	}
	public void setPhotoUrl(String photoUrl) {
		this.photoUrl = photoUrl;
	}
	@Override
	public String toString() {
		return "Teams [teamname=" + teamname + ", ID=" + ID + ", username=" + username + ", latitude=" + latitude
				+ ", longitude=" + longitude + ", photoUrl=" + photoUrl + "]";
	}	
}
