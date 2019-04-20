package models;

public class Stats {
	private int conversations;
	private int conversions;
	private int numYear;
	private int numWeek;
	private Volunteers vol;
	
	public Stats(int conversations, int conversions, int numYear, int numWeek, Volunteers vol) {
		super();
		this.conversations = conversations;
		this.conversions = conversions;
		this.numYear = numYear;
		this.numWeek = numWeek;
		this.vol = vol;
	}

	public int getConversations() {
		return conversations;
	}

	public void setConversations(int conversations) {
		this.conversations = conversations;
	}

	public int getConversions() {
		return conversions;
	}

	public void setConversions(int conversions) {
		this.conversions = conversions;
	}

	public int getNumYear() {
		return numYear;
	}

	public void setNumYear(int numYear) {
		this.numYear = numYear;
	}

	public int getNumWeek() {
		return numWeek;
	}

	public void setNumWeek(int numWeek) {
		this.numWeek = numWeek;
	}

	public Volunteers getVol() {
		return vol;
	}

	public void setVol(Volunteers vol) {
		this.vol = vol;
	}

	@Override
	public String toString() {
		return "Stats [conversations=" + conversations + ", conversions=" + conversions + ", numYear=" + numYear
				+ ", numWeek=" + numWeek + ", vol=" + vol + "]";
	}
	
	
}
