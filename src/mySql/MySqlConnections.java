package mySql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import models.*;

public class MySqlConnections {
	   static String             url              = "jdbc:mysql://aaqcurgqphlck8.cymiguyxmxqn.us-east-2.rds.amazonaws.com:3306/ADA";
	   static String             sqluser             = "remoteuser";
	   static String             sqlpassword         = "connectToADA";
	   static Connection         connection       = null;
	   
	   /**
	    * Attempts a user login, returns a user if successfull or null if not successful.
	    * 
	    * @param username The username to login with.
	    * @param password The password to login with.
	    * @return Returns a User model or null.
	    */
	   public static User Login(String username, String password) {
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
						statement.close();
						connection.close();
					}

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return user;
	   }
	   
	   /**
	    * Adds a new user.
	    * 
	    * @param username The new username of the user.
	    * @param password The new password of the user.
	    * @param firstname The new first name of the user.
	    * @param lastname The new last name of the user.
	    * @param role The new role of the user.
	    * @return True if the user was successfully added.
	    */
	   public static boolean AddUser(String username, String password, String firstname, String lastname, String role) {
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
					
					System.out.println(statement);
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

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		  return applications;
	   }
	   
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
						statement.close();
						connection.close();
					}

		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return application;
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
		   /*Applications testapp = new Applications("Colton3", "Drew", "Colton@email.com", "Senior", "University of Nebraska Omaha", 1000, true, 15, 5, true, 5, false, 0, true, 10, true, "Christian", "TEST AUDIO URL");
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
		   Applications app = getFullApplication(1);{
			   System.out.print(app);
		   }
		   
	   }
}
