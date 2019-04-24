package mySql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import models.*;

public class MySqlConnections {
	   static String             url              = "jdbc:mysql://aaqcurgqphlck8.cymiguyxmxqn.us-east-2.rds.amazonaws.com:3306/ADA";
	   static String             sqluser             = "remoteuser";
	   static String             sqlpassword         = "connectToADA";
	   static Connection         connection       = null;
	   
	   /**
	    * Attempts a user login, returns a user if successful or null if not successful.
	    * @param username The username to login with.
	    * @param password The password to login with.
	    * @return Returns a User model or null.
	    */
	   public static User login(String username, String password) {
		   connection = null;
		   User user = null;
		   PreparedStatement statement = null;
		   String loginSQL = "select firstname, lastname, role from Admins where username =? and password =sha1(?)";
		      try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return user;
		      }
		      try {
					
					statement = connection.prepareStatement(loginSQL);
					statement.setString(1, username);
					statement.setString(2, password);
					ResultSet rs = statement.executeQuery();
					if( rs.next()) {
						user = new User(username,
								rs.getString(1),
								rs.getString(2),
								rs.getString(3));
					}
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return user;
	   }
	   
	   /**
	    * Changes the password of a user.
	    * @param username The username to change the password for.
	    * @param oldpassword The old password of the user.
	    * @param newpassword The new password for the user.
	    * @return True if successful.
	    */
	   public static boolean changePassword(String username, String oldpassword, String newpassword) {
		   connection = null;
		   boolean complete = false;
		   PreparedStatement statement = null;
		   String loginSQL = "update Admins set password = ? where username = ? and password = ?";
		      try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return complete;
		      }
		      try {
					
					statement = connection.prepareStatement(loginSQL);
					statement.setString(1, newpassword);
					statement.setString(2, username);
					statement.setString(3, oldpassword);
					if(statement.executeUpdate() > 0) {
						complete = true;
					}
					statement.close();
					connection.close();
					
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return complete;
	   }
	   
	   
	   /**
	    * Adds a new user.
	    * @param username The new username of the user.
	    * @param password The new password of the user.
	    * @param firstname The new first name of the user.
	    * @param lastname The new last name of the user.
	    * @param role The new role of the user.
	    * @return True if the user was successfully added.
	    */
	   public static boolean addUser(String username, String password, String firstname, String lastname, String role) {
		   connection = null;
		   boolean complete = false;
		   PreparedStatement statement = null;
		   String addUser = "insert into Admins(username, password, firstname, lastname, role) " + 
					"values(?,sha1(?),?,?,?)";
		      try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return complete;
		      }
		      try {
					statement = connection.prepareStatement(addUser);
					statement.setString(1, username);
					statement.setString(2, password);
					statement.setString(3, firstname);
					statement.setString(4, lastname);
					statement.setString(5, role);
					if(statement.executeUpdate() > 0) {
						complete = true;
					}
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return complete;
	   }
	   
	   /**
	    * Adds a new team.
	    * @param teamname The name of the new team.
	    * @param teamleader The teamleader username of the team.
	    * @param latitude The latitude of the team.
	    * @param longitude The longitude of the team.
	    * @param pictureurl The url file path of the team picture.
	    * @return True if successful. 
	    */
	   public static boolean addTeam(String teamname, String teamleader,double latitude, double longitude, String pictureurl) {
		   connection = null;
		   boolean complete = false;
		   PreparedStatement statement = null;
		   String addTeam = "insert into Teams(teamname, teamleader, latitude, longitude, teampicture) "+
					"values(?,?,?,?,?)";
		      try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return complete;
		      }
		      try {
					statement = connection.prepareStatement(addTeam);
					statement.setString(1, teamname);
					statement.setString(2, teamleader);
					statement.setDouble(3, latitude);
					statement.setDouble(4, longitude);
					statement.setString(5, pictureurl);
					if(statement.executeUpdate() > 0) {
						complete = true;
					}
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return complete;
	   }
	   
	   /**
	    * Updates a team's information.
	    * @param teamID The teamID to update.
	    * @param teamname The name of the  team.
	    * @param teamleader The teamleader username of the team.
	    * @param latitude The latitude of the team.
	    * @param longitude The longitude of the team.
	    * @param pictureurl The url file path of the team picture.
	    * @return True if successful.
	    */
	   public static boolean updateTeam(int teamID, String teamname, String teamleader, double latitude, double longitude, String pictureurl) {
		   connection = null;
		   boolean complete = false;
		   PreparedStatement statement = null;
		   String addTeam = "update Teams set teamname = ?, teamleader = ?, latitude = ?, longitude = ?, teampicture = ? where teamID = ?";
		      try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return complete;
		      }
		      try {
					statement = connection.prepareStatement(addTeam);
					statement.setString(1, teamname);
					statement.setString(2, teamleader);
					statement.setDouble(3, latitude);
					statement.setDouble(4, longitude);
					statement.setString(5, pictureurl);
					statement.setInt(6, teamID);
					if(statement.executeUpdate() > 0) {
						complete = true;
					}
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return complete;
	   }
	   
	   /**
	    * Adds a new volunteer.
	    * @param volunteer The new volunteer to add.
	    * @return True if successful.
	    */
	   public static boolean addVolunteer(Volunteers volunteer) {
		   connection = null;
		   boolean complete = false;
		   PreparedStatement statement = null;
		   String addVolunteer = "insert into Volunteers(firstname,lastname,schoolyear,hometown,highschool,bio,teamID,volpicture,startdate) " +
					"values(?,?,?,?,?,?,?,?,curdate())";
		      try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return complete;
		      }
		      try {
					statement = connection.prepareStatement(addVolunteer);
					statement.setString(1, volunteer.getFirstname());
					statement.setString(2, volunteer.getLastname());
					statement.setString(3, volunteer.getSchoolyear());
					statement.setString(4, volunteer.getHometown());
					statement.setString(5, volunteer.getHighschool());
					statement.setString(6, volunteer.getBio());
					statement.setInt(7, volunteer.getTeamID());
					statement.setString(8, volunteer.getPictureUrl());
					if(statement.executeUpdate() > 0) {
						complete = true;
					}
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return complete;
	   }
	   
	   /**
	    * Adds a volunteer statistic.
	    * @param volID The ID of the volunteer.
	    * @param conversations The number of conversations for the week.
	    * @param conversions The number of conversions for the week.
	    * @param numyear The year number.
	    * @param numweek The week number.
	    * @return True if successful. 
	    */
	   public static boolean addStat(int volID, int conversations, int conversions, int numyear, int numweek) {
		   connection = null;
		   boolean complete = false;
		   PreparedStatement statement = null;
		   String addStat = "insert into Stats(volID,conversations,conversions,numyear,numweek) "+
				   "values(?,?,?,?,?)on duplicate key update conversations = ?, conversions = ?";
		   try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return complete;
		      }
		      try {
					statement = connection.prepareStatement(addStat);
					statement.setInt(1, volID);
					statement.setInt(2, conversations);
					statement.setInt(3, conversions);
					statement.setInt(4, numyear);
					statement.setInt(5, numweek);
					statement.setInt(6, conversations);
					statement.setInt(7, conversions);
					if(statement.executeUpdate() > 0) {
						complete = true;
					}
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return complete;
	   }
	   
	   /**
	    * Submits a new application to the database.
	    * @param app The application to submit.
	    * @return true if the application was submitted successfully.
	    */
	   public static boolean submitApplication(Applications app) {
		   connection = null;
		   boolean complete = false;
		   PreparedStatement statement = null;
		   String addApp = "insert into Applications(firstname,lastname,email,schoolyear,university,unipopulation,curteamoncampus,credithours,workhours,parttime,parttimehours,newman,newmanstudents,prolifegroup,prolifegroupstudents,north,religion,audiourl) " + 
					"values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		      try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return complete;
		      }
		      try {
					statement = connection.prepareStatement(addApp);
					statement.setString(1, app.getFirstname());
					statement.setString(2, app.getLastname());
					statement.setString(3, app.getEmail());
					statement.setString(4, app.getSchoolyear());
					statement.setString(5, app.getUniversity());
					statement.setInt(6, app.getUnipopulation());
					statement.setBoolean(7, app.isCurteamoncampus());
					statement.setInt(8, app.getCredithours());
					statement.setInt(9, app.getWorkhours());
					statement.setBoolean(10, app.isParttime());
					statement.setInt(11, app.getPartimehours());
					statement.setBoolean(12, app.isNewman());
					statement.setInt(13, app.getNewmanstudents());
					statement.setBoolean(14, app.isProlifegroup());
					statement.setInt(15, app.getProlifegroupstudents());
					statement.setBoolean(16, app.isNorth());
					statement.setString(17, app.getReligion());
					statement.setString(18, app.getAudiourl());
					
//					System.out.println(statement);
					if(statement.executeUpdate() > 0) {
						complete = true;
					}
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return complete;
	   }
	   
	   /**
	    * Lists all applications.
	    * @param complete if the applications retrieved are already completed or not
	    * @return a list of all applications
	    */
	   public static ArrayList<Applications> listApplications(boolean complete){
		   connection = null;
		   ArrayList<Applications> applications = new ArrayList<Applications>();
		   PreparedStatement statement = null;
		   String getApps = "select appID, firstname, lastname, datetime from Applications where completed = ? order by datetime";
		   try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return applications;
		      }
		      try {
					statement = connection.prepareStatement(getApps);
					statement.setBoolean(1, complete);
					ResultSet rs = statement.executeQuery();
					while(rs.next()) {
						applications.add(new Applications(rs.getInt("appId"), 
								rs.getString("firstname"), 
								rs.getString("lastname"), 
								rs.getString("datetime")));
					}
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		  return applications;
	   }
	   
	   /**
	    * Gets a full application to review.
	    * @param ID the ID of the application to retrieve
	    * @return The full application.
	    */
	   public static Applications getFullApplication(int ID) {
		   connection = null;
		   Applications application = null;
		   PreparedStatement statement = null;
		   String getApp = "select firstname, lastname, email, schoolyear, university, unipopulation, curteamoncampus, credithours, workhours, parttime, parttimehours, newman, newmanstudents, prolifegroup, prolifegroupstudents, north, religion, audiourl from Applications where appID = ?";
		      try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return application;
		      }
		      try {
					statement = connection.prepareStatement(getApp);
					statement.setInt(1, ID);
					ResultSet rs = statement.executeQuery();
					if( rs.next()) {
						application = new Applications(ID, 
								rs.getString(1), 
								rs.getString(2), 
								rs.getString(3), 
								rs.getString(4), 
								rs.getString(5), 
								rs.getInt(6), 
								rs.getBoolean(7), 
								rs.getInt(8), 
								rs.getInt(9), 
								rs.getBoolean(10), 
								rs.getInt(11), 
								rs.getBoolean(12),
								rs.getInt(13), 
								rs.getBoolean(14), 
								rs.getInt(15), 
								rs.getBoolean(16), 
								rs.getString(17), 
								rs.getString(18));
					}
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return application;
	   }
	   
	   /**
	    * Accepts or declines an application
	    * @param ID The ID of the application to accept or decline.
	    * @param accept If the ID will be accepted.
	    * @return True if the update was successful.
	    */
	   public static boolean reviewApplication(int ID, boolean accept) {
		   connection = null;
		   boolean complete = false;
		   PreparedStatement statement = null;
		   String reviewApp = "update Applications set accepted = ?, completed = 1 where appid = ?";	
		   try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return complete;
		      }
		      try {
					statement = connection.prepareStatement(reviewApp);
					statement.setBoolean(1, accept);
					statement.setInt(2, ID);
					if(statement.executeUpdate() > 0) {
						complete = true;
					}
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return complete;
	   }
	   
	   /**
	    * Gets team leaders and their names.
	    * @return An arraylist of Users.
	    */
	   public static ArrayList<User> getTeamLeaders(){
		   ArrayList<User> teamleadernames = new ArrayList<User>();
		   connection = null;
		   PreparedStatement statement = null;
		   String getTeams = "select username, firstname, lastname from Admins where role = 'Team Leader'";
		   try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return teamleadernames;
		      }
		      try {
					statement = connection.prepareStatement(getTeams);
					ResultSet rs = statement.executeQuery();
					while(rs.next()) {
						teamleadernames.add(new User(rs.getString(1), rs.getString(2), rs.getString(3), "Team Leader"));
					}
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return teamleadernames;
	   }
	   
	   /**
	    * Gets a list of team names.
	    * @return A string arraylist of team names.
	    */
	   public static ArrayList<String> getTeamNames(){
		   ArrayList<String> teamnames = new ArrayList<String>();
		   connection = null;
		   PreparedStatement statement = null;
		   String getTeams = "select teamname from Teams";
		   try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return teamnames;
		      }
		      try {
					statement = connection.prepareStatement(getTeams);
					ResultSet rs = statement.executeQuery();
					while(rs.next()) {
						teamnames.add(rs.getString(1));
					}
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return teamnames;
	   }
	   /**
	    * Gets a teamID by teamleader username.
	    * @param teamleader The teamleader to retrieve of the username.
	    * @return The teamID or -1.
	    */
	   public static int getTeamID(String teamleader){
		   int teamID = -1;
		   connection = null;
		   PreparedStatement statement = null;
		   System.out.println(teamleader);
		   String getTeams = "select teamID from Teams where teamleader = ?";
		   try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return teamID;
		      }
		      try {
					statement = connection.prepareStatement(getTeams);
					statement.setString(1, teamleader);
					ResultSet rs = statement.executeQuery();
					if(rs.next()) {
						teamID = rs.getInt(1);
					}
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      } catch(Exception e) {
		    	  e.printStackTrace();
		      }
		   return teamID;
	   }
	   
	   /**
	    * Gets a list of teams.
	    * @return A string arraylist of teams.
	    */
	   public static ArrayList<Teams> getTeams(){
		   ArrayList<Teams> teams = new ArrayList<Teams>();
		   connection = null;
		   PreparedStatement statement = null;
		   
		   String getTeams = "select * from Teams";
		   try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return teams;
		      }
		      try {
					statement = connection.prepareStatement(getTeams);
					ResultSet rs = statement.executeQuery();
					while(rs.next()) {
						teams.add(new Teams(rs.getString("teamname"), rs.getInt("teamID"), rs.getString("teamleader"), rs.getDouble("latitude"), rs.getDouble("longitude"), rs.getString("teampicture")));
					}
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return teams;
	   }
	   /**
	    * Gets a list of all active volunteers.
	    * @param teamID The teamID of the team the volunteers are in.
	    * @return
	    */
	   public static ArrayList<Volunteers> getActiveTeamVolunteers(int teamID){
		   ArrayList<Volunteers> volunteers = new ArrayList<Volunteers>();
		   connection = null;
		   PreparedStatement statement = null;
		   String getActiveTeamMembers = "select * from Volunteers where teamID = ? and active = 1";
		   try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return volunteers;
		      }
		      try {
					statement = connection.prepareStatement(getActiveTeamMembers);
					statement.setInt(1, teamID);
					ResultSet rs = statement.executeQuery();
					while(rs.next()) {
						volunteers.add(new Volunteers(rs.getString("firstname"), rs.getString("lastname"), rs.getInt("teamID"), rs.getString("schoolyear"), rs.getString("hometown"), rs.getString("highschool"), rs.getString("bio"), rs.getString("volpicture"), rs.getInt("volID"), rs.getString("startdate")));
					}
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return volunteers;
	   }
	   /**
	    * Gets a list of all volunteers.
	    * @param teamID The teamID of volunteers.
	    * @return A list of volunteers.
	    */
	   public static ArrayList<Volunteers> getAllTeamVolunteers(int teamID){
		   ArrayList<Volunteers> volunteers = new ArrayList<Volunteers>();
		   connection = null;
		   PreparedStatement statement = null;
		   String getActiveTeamMembers = "select * from Volunteers where teamID = ?";
		   try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return volunteers;
		      }
		      try {
					statement = connection.prepareStatement(getActiveTeamMembers);
					statement.setInt(1, teamID);
					ResultSet rs = statement.executeQuery();
					while(rs.next()) {
						volunteers.add(new Volunteers(rs.getString("firstname"), rs.getString("lastname"), rs.getInt("teamID"), rs.getString("schoolyear"), rs.getString("hometown"), rs.getString("highschool"), rs.getString("bio"), rs.getString("volpicture"), rs.getInt("volID"), rs.getString("startdate")));
					}
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return volunteers;
	   }	   
	   
	   /**
	    * Sets volunteers active or inactive.
	    * @param volID The ID of the volunteer.
	    * @param active If the volunteer will be set to active or not.
	    * @return If successful.
	    */
	   public static boolean setVolunteerActive(int volID, boolean active) {
		   connection = null;
		   boolean complete = false;
		   PreparedStatement statement = null;
		   String setActive = "update Volunteers set active = ? where volID = ?";	
		   try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return complete;
		      }
		      try {
					statement = connection.prepareStatement(setActive);
					if(active) {
						statement.setBoolean(1, true);
					}
					else {
						statement.setBoolean(1, false);
					}
					statement.setInt(2, volID);
					if(statement.executeUpdate() > 0) {
						complete = true;
					}
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return complete;
	   }
	   
	   /**
	    * Adds a news article.
	    * @param title The title of the news article.
	    * @param contents The contents of the news article.
	    * @param pictureurl The pictureurl of the news article.
	    * @return If successful or not.
	    */
	   public static boolean addNews(String title, String contents, String pictureurl, int teamID) {
		   connection = null;
		   boolean complete = false;
		   PreparedStatement statement = null;
		   String addNews = "insert into News(title, contents, datemade, pictureurl, teamID) " + 
					"values(?, ?, now(), ?, ?)";
		      try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return complete;
		      }
		      try {
					statement = connection.prepareStatement(addNews);
					statement.setString(1, title);
					statement.setString(2, contents);
					statement.setString(3, pictureurl);
					statement.setInt(4, teamID);
					if(statement.executeUpdate() > 0) {
						complete = true;
					}
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return complete;
	   }
	   
	   /**
	    * Updates a news article.
	    * @param newsID The ID of the news to update.
	    * @param title The title of the news article.
	    * @param contents The content of the news article. 
	    * @param pictureurl The picture url of the news article. 
	    * @return If successful or not.
	    */
	   public static boolean updateNews(int newsID, String title, String contents, String pictureurl) {
		   connection = null;
		   boolean complete = false;
		   PreparedStatement statement = null;
		   String addNews = "update News set title =?, contents = ?, pictureurl = ? where newsID = ?";
		      try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return complete;
		      }
		      try {
					statement = connection.prepareStatement(addNews);
					statement.setString(1, title);
					statement.setString(2, contents);
					statement.setString(3, pictureurl);
					statement.setInt(4, newsID);
					if(statement.executeUpdate() > 0) {
						complete = true;
					}
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return complete;
	   }
	   
	   /**
	    * Retrieves a full news article.
	    * @param newsID The ID of the news article to retreive.
	    * @return The full news article.
	    */
	   public static News getFullNews(int newsID) {
		   connection = null;
		   News article = null;
		   PreparedStatement statement = null;
		   String getFullNews = "select title, contents, datemade, pictureurl from News where newsID = ?";
		      try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return article;
		      }
		      try {
					statement = connection.prepareStatement(getFullNews);
					statement.setInt(1, newsID);
					ResultSet rs = statement.executeQuery();
					if( rs.next()) {
						article = new News(rs.getString("title"), rs.getString("contents"), rs.getString("datemade"), rs.getString("pictureurl"));
					}
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return article;
	   }
	   
	   /**
	    * Gets a volunteer by ID.
	    * @param ID the ID of the volunteer to retrieve
	    * @return The volunteer.
	    */
	   public static Volunteers getVol(int ID) {
		   connection = null;
		   Volunteers vol = null;
		   PreparedStatement statement = null;
		   String getVol = "select * from Volunteers where volID = ?";
		      try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return vol;
		      }
		      try {
					statement = connection.prepareStatement(getVol);
					statement.setInt(1, ID);
					ResultSet rs = statement.executeQuery();
					if( rs.next()) {
						vol = new Volunteers(rs.getString("firstname"), rs.getString("lastname"), rs.getInt("teamID"), rs.getString("schoolyear"), rs.getString("hometown"), rs.getString("highschool"), rs.getString("bio"), rs.getString("volpicture"), rs.getInt("volID"), rs.getString("startdate"));
					}
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return vol;
	   }
	   
	   /**
	    * Gets a team by ID.
	    * @param ID the ID of the team to retrieve
	    * @return The team.
	    */
	   public static Teams getTeam(int ID) {
		   connection = null;
		   Teams team = null;
		   PreparedStatement statement = null;
		   String getVol = "select * from Teams where teamID = ?";
		      try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return team;
		      }
		      try {
					statement = connection.prepareStatement(getVol);
					statement.setInt(1, ID);
					ResultSet rs = statement.executeQuery();
					if( rs.next()) {
						team = new Teams(rs.getString("teamname"), ID, rs.getString("teamleader"), rs.getDouble("latitude"), rs.getDouble("longitude"), rs.getString("teampicture"));
					}
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return team;
	   }
	   
	   /**
	    * Updates a volunteer by ID.
	    * @param vol the new volunteer info (including its id)
	    * @return If successful or not.
	    */
	   public static boolean updateVol(Volunteers vol) {
		   boolean complete = false;
		   connection = null;
		   PreparedStatement statement = null;
		   String updateVol = "update Volunteers set firstname = ?, lastname = ?, schoolyear = ?, hometown = ?, highschool = ?, bio = ?, volpicture = ? where volID = ?";
		      try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return complete;
		      }
		      try {
					statement = connection.prepareStatement(updateVol);
					statement.setString(1,  vol.getFirstname());
					statement.setString(2,  vol.getLastname());
					statement.setString(3, vol.getSchoolyear());
					statement.setString(4,  vol.getHometown());
					statement.setString(5,  vol.getHighschool());
					statement.setString(6,  vol.getBio());
					statement.setString(7,  vol.getPictureUrl());
					statement.setInt(8, vol.getVolID());
					
					if(statement.executeUpdate() > 0) {
						complete = true;
					}

					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return complete;
	   }
	   
	   /**
	    * Updates a stat by ID, year, and week.
	    * @param stat the new stat data
	    * @return If successful or not.
	    */
	   public static boolean updateStat(int volID, int conversations, int conversions, int year, int week) {
		   boolean complete = false;
		   connection = null;
		   PreparedStatement statement = null;
		   String updateStat = "update Stats set conversations = ?, conversions = ? where volID = ? and numweek = ? and numyear = ?";
		      try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return complete;
		      }
		      try {
					statement = connection.prepareStatement(updateStat);
					statement.setInt(1, conversations);
					statement.setInt(2, conversions);
					statement.setInt(3, volID);
					statement.setInt(4, week);
					statement.setInt(5, year);
					
					if(statement.executeUpdate() > 0) {
						complete = true;
					}

					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return complete;
	   }
	   
	   /**
	    * Deletes a stat by volID, year, and week.
	    * @param id the id of the stat to be deleted
	    * @return If successful or not.
	    */
	   public static boolean deleteStat(int volID, int year, int week) {
		   boolean complete = false;
		   connection = null;
		   PreparedStatement statement = null;
		   String deleteStat = "delete from Stats where volID = ? and numyear = ? and numweek = ?";
		      try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return complete;
		      }
		      try {
					statement = connection.prepareStatement(deleteStat);
					statement.setInt(1,  volID);
					statement.setInt(2,  year);
					statement.setInt(3,  week);
					if(statement.executeUpdate() > 0) {
						complete = true;
					}

					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return complete;
	   }
	   
	   /**
	    * Deletes a volunteer by ID.
	    * @param id the id of the volunteer to be deleted
	    * @return If successful or not.
	    */
	   public static boolean deleteVol(int id) {
		   boolean complete = false;
		   connection = null;
		   PreparedStatement statement = null;
		   String deleteVol = "delete from Volunteers where volID = ?";
		      try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return complete;
		      }
		      try {
					statement = connection.prepareStatement(deleteVol);
					statement.setInt(1,  id);
					if(statement.executeUpdate() > 0) {
						complete = true;
					}

					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return complete;
	   }

	   /**
	    * Deletes a team.
	    * @param id The ID of the team to delete.
	    * @return If successful or not.
	    */
	   public static boolean deleteTeam(int id) {
		   boolean complete = false;
		   connection = null;
		   PreparedStatement statement = null;
		   String deleteVol = "delete from Teams where teamID = ?";
		      try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return complete;
		      }
		      try {
					statement = connection.prepareStatement(deleteVol);
					statement.setInt(1, id);
					
					if(statement.executeUpdate() > 0) {
						complete = true;
					}

					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return complete;
	   }
	   
	   /**
	    * Deletes a news article.
	    * @param id The ID of the news article to delete.
	    * @return If successful or not.
	    */
	   public static boolean deleteNews(int id) {
		   boolean complete = false;
		   connection = null;
		   PreparedStatement statement = null;
		   String deleteVol = "delete from News where newsID = ?";
		      try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return complete;
		      }
		      try {
					statement = connection.prepareStatement(deleteVol);
					statement.setInt(1, id);
					
					if(statement.executeUpdate() > 0) {
						complete = true;
					}

					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return complete;
	   }
	   
	   /**
	    * Returns total number of conversations for a team
	    * @param id the id of a team
	    * @return If successful or not.
	    */
	   public static int getTotalConversations(int id) {
		   int totalConversations = 0;
		   connection = null;
		   PreparedStatement statement = null;
		   String getTotalConversations = "SELECT SUM(Stats.conversations) FROM Stats INNER JOIN Volunteers ON Stats.volID=Volunteers.volID WHERE Volunteers.teamID = ?";
		      try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return totalConversations;
		      }
		      try {
					statement = connection.prepareStatement(getTotalConversations);
					statement.setInt(1, id);
					
					ResultSet rs = statement.executeQuery();
					if( rs.next()) {
						totalConversations = rs.getInt(1);
					}

					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return totalConversations;
	   }
	   
	   /**
	    * Returns all distinct weeks and years
	    * @param id the id of a team
	    * @return If successful or not.
	    */
	   public static Map<Integer, ArrayList<Integer>> getDistinctYearsWeeks(int id) {
		   Map<Integer, ArrayList<Integer>> yearWeeksMap = new HashMap<>();
		   connection = null;
		   PreparedStatement statement = null;
		   String getDistinctYearsWeeks = "SELECT DISTINCT numyear, numweek\r\n" + 
		   								  "FROM Stats\r\n" + 
		   								  "INNER JOIN Volunteers ON Stats.volID=Volunteers.volID\r\n" + 
		   								  "WHERE numyear IS NOT NULL and numweek IS NOT NULL and Volunteers.teamID = ?";
		      try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return yearWeeksMap;
		      }
		      try {
					statement = connection.prepareStatement(getDistinctYearsWeeks);
					statement.setInt(1, id);
					
					ResultSet rs = statement.executeQuery();
					while( rs.next()) {
						int yearKey = rs.getInt("numyear");
						int week = rs.getInt("numweek");
						if(!yearWeeksMap.containsKey(yearKey)) {							
							yearWeeksMap.put(yearKey, new ArrayList<>());
						}			
						yearWeeksMap.get(yearKey).add(week);

					}

					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return yearWeeksMap;
	   }
	   
	   /**
	    * Gets a list of news articles but not their contents.
	    * @return A list of news articles.
	    */
	   public static ArrayList<News> getNewsList(int id){
		   ArrayList<News> newsList = new ArrayList<News>();
		   connection = null;
		   PreparedStatement statement = null;
		   String getNewsList = "select newsID, title, datemade, pictureurl from News where teamID = ? order by datemade desc";
		   try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return newsList;
		      }
		      try {
					statement = connection.prepareStatement(getNewsList);
					statement.setInt(1,  id);
					ResultSet rs = statement.executeQuery();
					while(rs.next()) {
						newsList.add(new News(rs.getInt("newsID"), rs.getString("title"), rs.getString("datemade"), rs.getString("pictureurl")));
					}
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return newsList;
	   }
	   
	   /**
	    * Gets a list of news articles but not their contents.
	    * @return A list of news articles.
	    */
	   public static ArrayList<Stats> getStats(int teamId, int numYear, int numWeek){
		   ArrayList<Stats> stats = new ArrayList<Stats>();
		   connection = null;
		   PreparedStatement statement = null;
		   String getStats = "SELECT Stats.*,Volunteers.firstname, Volunteers.lastname FROM Stats INNER JOIN Volunteers ON Stats.volID=Volunteers.volID WHERE Volunteers.teamID = ? and Stats.numyear = ? and Stats.numweek = ?";
		   try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return stats;
		      }
		      try {
					statement = connection.prepareStatement(getStats);
					statement.setInt(1,  teamId);
					statement.setInt(2,  numYear);
					statement.setInt(3,  numWeek);
					ResultSet rs = statement.executeQuery();
					while(rs.next()) {
						stats.add(new Stats(rs.getInt("conversations"), rs.getInt("conversions"), rs.getInt("numyear"), rs.getInt("numWeek"), new Volunteers(rs.getString("firstname"), rs.getString("lastname"), teamId, rs.getInt("volID"))));
					}
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return stats;
	   }
	   
	   /**
	    * Gets a list of stats.
	    * @return A list of stats.
	    */
	   public static ArrayList<Stats> getMostRecentStats(int id){
		   ArrayList<Stats> stats = new ArrayList<>();
		   connection = null;
		   CallableStatement statement = null;
		   String getStats = "{call getMostRecentStats(?)}";
		   try {
		         connection = DriverManager.getConnection(url + "?noAccessToProcedureBodies=true", sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return stats;
		      }
		      try {		   
		    	    statement = connection.prepareCall(getStats);

					statement.setInt(1,  id);

					boolean hadResults = statement.execute();
					
					while (hadResults) {
				        ResultSet rs = statement.getResultSet();

				        // process result set
				        while(rs.next()) {
							stats.add(new Stats(rs.getInt("conversations"), rs.getInt("conversions"), rs.getInt("numyear"), rs.getInt("numWeek"), new Volunteers(rs.getString("firstname"), rs.getString("lastname"), rs.getInt("volID"), id)));
						}

				        hadResults = statement.getMoreResults();
				    }
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return stats;
	   }
	   
	   /**
	    * Gets a list of news articles but not their contents.
	    * @return A list of news articles.
	    */
	   public static News getMostRecentNews(int id){
		   News news = null;
		   connection = null;
		   PreparedStatement statement = null;
		   String getMostRecentNews = "select newsID, title, contents, datemade, pictureurl from News where teamID = ? order by datemade desc limit 1";
		   try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return news;
		      }
		      try {
					statement = connection.prepareStatement(getMostRecentNews);
					statement.setInt(1,  id);
					ResultSet rs = statement.executeQuery();
					while(rs.next()) {
						news = new News(rs.getInt("newsID"), rs.getString("title"), rs.getString("contents"), rs.getString("datemade"), rs.getString("pictureurl"), id);
					}
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return news;
	   }
	   
	   /**
	    * Gets a list of news articles but not their contents, excluding the news id parameter
	    * @return A list of news articles.
	    */
	   public static ArrayList<News> getNewsListExcludeId(int teamId, int newsId){
		   ArrayList<News> newsList = new ArrayList<News>();
		   connection = null;
		   PreparedStatement statement = null;
		   String getNewsList = "select newsID, title, datemade, pictureurl from News where teamID = ? and newsId <> ? order by datemade desc";
		   try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return newsList;
		      }
		      try {
					statement = connection.prepareStatement(getNewsList);
					statement.setInt(1,  teamId);
					statement.setInt(2,  newsId);
					ResultSet rs = statement.executeQuery();
					while(rs.next()) {
						newsList.add(new News(rs.getInt("newsID"), rs.getString("title"), rs.getString("datemade"), rs.getString("pictureurl")));
					}
					statement.close();
					connection.close();

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return newsList;
	   }
	   
	   /**
	    * Main function used for testing.
	    * @param args
	    */
	   public static void main(String[] args) {
		   //Test functions
		   
		   
		   // Insert User Test, will fail if username already exists
		   /*if(AddUser("testuser2", "testpass", "User", "Test", "Role")) {
			   System.out.println("Add user successful");
		   }
		   else {
			   System.out.println("Add test user failed");
		   }*/
		   
		   // Login Test
		   /*
		   User user = Login("testuser2", "testpass");
		   if(user != null) {
			   System.out.println("Test user logged in");
			   System.out.println(user);
		   }
		   else {
			   System.out.println("Test user failed to log in");
		   }*/
		   
		   //Submit Application Test
		   /*Applications testapp = new Applications("Colton5", "Drew", "Colton@email.com", "Senior", "University of Nebraska Omaha", 1000, true, 15, 5, true, 5, false, 0, true, 10, true, "Christian", "TEST AUDIO URL");
		   if(submitApplication(testapp)) {
			   System.out.println("App submitted successfully");
		   }
		   else {
			   System.out.println("App submit Failed!");
		   }*/
		   
		   // Application List Test
		   /*ArrayList<Applications> apps = listApplications(false);
		   for(Applications app : apps) {
			  System.out.println(app.getID() + " " + app.getFirstname() + " "  + app.getLastname() + " " + app.getDatetime());
		   }
		   if( apps.isEmpty()) {
			   System.out.println("Application list empty.");
		   }*/
		   
		   // Get Full App Test
		   /*Applications app = getFullApplication(3);{
			   System.out.print(app);
		   }*/
		   
		   // Review App Test
		   /*if(reviewApplication(1,true)) {
			   System.out.println("Accepted App successfully");
		   }
		   else {
			   System.out.println("Failed to accept app.");
		   }*/
		   
		   // Add Team Test, will fail user is not a admin
		   /*if(AddTeam("Test Team", "testuser2", 1, 1, "TEST PICTURE URL")) {
			   System.out.println("Added team successfully");
		   }
		   else {
			   System.out.println("Failed to add team.");
		   }*/
		   // Add Volunteer Test
		   /*Volunteers testvol = new Volunteers("TestVol2", "Vol1", 3, "Junior", "Test Hometown", "Test Highschool", "Test Bio", "Test pictureURL");
		   if(addVolunteer(testvol)) {
			   System.out.println("Added volunteer successfully");
		   }
		   else {
			   System.out.println("Failed to add volunteer.");
		   }*/
		   //Add Volunteer Stat Test
		   /*if(addStat(1, 4, 1, 1, 2)) {
			   System.out.println("Added volunteer weekly stat successfully");
		   }
		   else {
			   System.out.println("Failed to add weekly stat.");
		   }*/
		   //Add News Test
		   addNews("TEST NEWS TITLE", "This is the contents or this article", "newspictureurl", 3);
		   //Get Full News Test
		   //System.out.println(getFullNews(3));
	   }
}
