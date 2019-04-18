package models;

public class News implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	int newsID;
	String title;
	String contents;
	String date;
	String pictureurl;
	int teamID;
	

	public News(int newsID, String title, String contents, String date, String pictureurl, int teamID) {
		super();
		this.newsID = newsID;
		this.title = title;
		this.contents = contents;
		this.date = date;
		this.pictureurl = pictureurl;
		this.teamID = teamID;
	}

	/**
	 * Constructor for getting a full news article.
	 * @param title
	 * @param contents
	 * @param date
	 * @param pictureurl
	 */
	public News(String title, String contents, String date, String pictureurl) {
		super();
		this.title = title;
		this.contents = contents;
		this.date = date;
		this.pictureurl = pictureurl;
	}
	
	/**
	 * Constructor for getting partial title for listing all news articles.
	 * @param newsID
	 * @param title
	 * @param date
	 * @param pictureurl
	 */
	public News(int newsID, String title, String date, String pictureurl) {
		super();
		this.newsID = newsID;
		this.title = title;
		this.date = date;
		this.pictureurl = pictureurl;
	}


	public int getNewsID() {
		return newsID;
	}
	public void setNewsID(int newsID) {
		this.newsID = newsID;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getPictureurl() {
		return pictureurl;
	}
	public void setPictureurl(String pictureurl) {
		this.pictureurl = pictureurl;
	}

	@Override
	public String toString() {
		return "News [newsID=" + newsID + ", title=" + title + ", contents=" + contents + ", date=" + date
				+ ", pictureurl=" + pictureurl + "]";
	}
	
	
	
	
	
}
