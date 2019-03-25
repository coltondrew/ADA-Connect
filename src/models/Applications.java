package models;

public class Applications implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	int ID;
	String firstname;
	String lastname;
	String email;
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
	String datetime;
	
	
	/**
	 * Creates a new application to submit.
	 */
	public Applications(String firstname, String lastname, String email, String schoolyear, String university,
			int unipopulation, boolean curteamoncampus, int credithours, int workhours, boolean parttime,
			int partimehours, boolean newman, int newmanstudents, boolean prolifegroup, int prolifegroupstudents,
			boolean north, String religion, String audiourl) {
		super();
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.schoolyear = schoolyear;
		this.university = university;
		this.unipopulation = unipopulation;
		this.curteamoncampus = curteamoncampus;
		this.credithours = credithours;
		this.workhours = workhours;
		this.parttime = parttime;
		this.partimehours = partimehours;
		this.newman = newman;
		this.newmanstudents = newmanstudents;
		this.prolifegroup = prolifegroup;
		this.prolifegroupstudents = prolifegroupstudents;
		this.north = north;
		this.religion = religion;
		this.audiourl = audiourl;
	}
	
	/**
	 * Constructor to get for listing applications.
	 * @param iD
	 * @param firstname
	 * @param lastname
	 * @param datetime
	 */
	public Applications(int iD, String firstname, String lastname, String datetime) {
		super();
		ID = iD;
		this.firstname = firstname;
		this.lastname = lastname;
		this.datetime = datetime;
	}
	
	

	/**
	 * Constructor for viewing a application.
	 * @param iD
	 * @param firstname
	 * @param lastname
	 * @param email
	 * @param schoolyear
	 * @param university
	 * @param unipopulation
	 * @param curteamoncampus
	 * @param credithours
	 * @param workhours
	 * @param parttime
	 * @param partimehours
	 * @param newman
	 * @param newmanstudents
	 * @param prolifegroup
	 * @param prolifegroupstudents
	 * @param north
	 * @param religion
	 * @param audiourl
	 */
	public Applications(int iD, String firstname, String lastname, String email, String schoolyear, String university,
			int unipopulation, boolean curteamoncampus, int credithours, int workhours, boolean parttime,
			int partimehours, boolean newman, int newmanstudents, boolean prolifegroup, int prolifegroupstudents,
			boolean north, String religion, String audiourl) {
		super();
		ID = iD;
		this.firstname = firstname;
		this.lastname = lastname;
		this.email = email;
		this.schoolyear = schoolyear;
		this.university = university;
		this.unipopulation = unipopulation;
		this.curteamoncampus = curteamoncampus;
		this.credithours = credithours;
		this.workhours = workhours;
		this.parttime = parttime;
		this.partimehours = partimehours;
		this.newman = newman;
		this.newmanstudents = newmanstudents;
		this.prolifegroup = prolifegroup;
		this.prolifegroupstudents = prolifegroupstudents;
		this.north = north;
		this.religion = religion;
		this.audiourl = audiourl;
	}

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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getDatetime() {
		return datetime;
	}
	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}

	@Override
	public String toString() {
		return "Applications [ID=" + ID + ", firstname=" + firstname + ", lastname=" + lastname + ", email=" + email
				+ ", schoolyear=" + schoolyear + ", university=" + university + ", unipopulation=" + unipopulation
				+ ", curteamoncampus=" + curteamoncampus + ", credithours=" + credithours + ", workhours=" + workhours
				+ ", parttime=" + parttime + ", partimehours=" + partimehours + ", newman=" + newman
				+ ", newmanstudents=" + newmanstudents + ", prolifegroup=" + prolifegroup + ", prolifegroupstudents="
				+ prolifegroupstudents + ", north=" + north + ", religion=" + religion + ", audiourl=" + audiourl
				+ ", datetime=" + datetime + "]";
	}
	
	
}
