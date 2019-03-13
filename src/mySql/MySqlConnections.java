package mySql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import models.User;

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
					String loginSQL = "select firstname, lastname, role from Admins where username =? and password =sha1(?)";
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
	    * 
	    * @param username The new username of the user.
	    * @param password The new password of the user.
	    * @param firstname The new first name of the user.
	    * @param lastname The new last name of the user.
	    * @param role The new role of the user.
	    * @return
	    */
	   public static boolean AddUser(String username, String password, String firstname, String lastname, String role) {
		   connection = null;
		   boolean complete = false;
		   PreparedStatement statement = null;
			String addUser = "insert into Admins(username, password, firstname, lastname, role) " + 
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
	    * Main function used for testing.
	    * @param args
	    */
	   public static void main(String[] args) {
		   //Test functions
		   
		   // Login Test
		   /*User user = Login("testuser", "testpass");
		   if(user != null) {
			   System.out.println("Test user logged in");
			   System.out.println(user);
		   }
		   else {
			   System.out.println("Test user failed to log in");
		   }*/
		   
		   // Insert User Test, will fail if user already exists
		   if(AddUser("testuser2", "password", "User", "Test", "Role")) {
			   System.out.println("Add user successful");
		   }
		   else {
			   System.out.println("Add test user failed");
		   }
	   }
}
