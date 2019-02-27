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
	   
	   public static User Login(String username, String password) {
		   connection = null;
		   User user = null;
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
					PreparedStatement preparedStatement = connection.prepareStatement(loginSQL);
					preparedStatement.setString(1, username);
					preparedStatement.setString(2, password);
					ResultSet rs = preparedStatement.executeQuery();
					if( rs.next()) {
						user = new User(username,
								rs.getString(1),
								rs.getString(2),
								rs.getString(3));

					}
					preparedStatement.close();
					connection.close();
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }

		   return user;
	   }
	   
	   public static void main(String[] args) {
		   //Test functions
		   User user = Login("testuser", "testpass");
		   if(user != null) {
			   System.out.println("Test user logged in");
			   System.out.println(user);
		   }
		   else {
			   System.out.println("Test user failed to log in");
		   }
	   }
}
