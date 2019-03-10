package models;

public class Applications implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	int ID;
	String firstname;
	String lastname;
	String schoolyear; //Dropdown menu
	String university;
	int unipopulation;
	boolean curteamoncampus;
	int credithours;
	int workhours;
	boolean parttime;
	int partimehours;
	boolean newman;
	int newmanstudents;
	boolean prolifegroup;
	int prolifegroupstudents;
	boolean north; //North or south
	String religion; //Choices
	String audiourl;
	
	public int getID() {
		return ID;
	}
	public void setID(int ID) {
		this.ID = ID;
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
	public String getSchoolyear() {
		return schoolyear;
	}
	public void setSchoolyear(String schoolyear) {
		this.schoolyear = schoolyear;
	}
	public String getUniversity() {
		return university;
	}
	public void setUniversity(String university) {
		this.university = university;
	}
	public int getUnipopulation() {
		return unipopulation;
	}
	public void setUnipopulation(int unipopulation) {
		this.unipopulation = unipopulation;
	}
	public boolean isCurteamoncampus() {
		return curteamoncampus;
	}
	public void setCurteamoncampus(boolean curteamoncampus) {
		this.curteamoncampus = curteamoncampus;
	}
	public int getCredithours() {
		return credithours;
	}
	public void setCredithours(int credithours) {
		this.credithours = credithours;
	}
	public int getWorkhours() {
		return workhours;
	}
	public void setWorkhours(int workhours) {
		this.workhours = workhours;
	}
	public boolean isParttime() {
		return parttime;
	}
	public void setParttime(boolean parttime) {
		this.parttime = parttime;
	}
	public int getPartimehours() {
		return partimehours;
	}
	public void setPartimehours(int partimehours) {
		this.partimehours = partimehours;
	}
	public boolean isNewman() {
		return newman;
	}
	public void setNewman(boolean newman) {
		this.newman = newman;
	}
	public int getNewmanstudents() {
		return newmanstudents;
	}
	public void setNewmanstudents(int newmanstudents) {
		this.newmanstudents = newmanstudents;
	}
	public boolean isProlifegroup() {
		return prolifegroup;
	}
	public void setProlifegroup(boolean prolifegroup) {
		this.prolifegroup = prolifegroup;
	}
	public int getProlifegroupstudents() {
		return prolifegroupstudents;
	}
	public void setProlifegroupstudents(int prolifegroupstudents) {
		this.prolifegroupstudents = prolifegroupstudents;
	}
	public boolean isNorth() {
		return north;
	}
	public void setNorth(boolean north) {
		this.north = north;
	}
	public String getReligion() {
		return religion;
	}
	public void setReligion(String religion) {
		this.religion = religion;
	}
	public String getAudiourl() {
		return audiourl;
	}
	public void setAudiourl(String audiourl) {
		this.audiourl = audiourl;
	}
	
	
	
}