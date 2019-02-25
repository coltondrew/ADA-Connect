package mySql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MySqlConnections {
	   static String             url              = "jdbc:mysql://aaqcurgqphlck8.cymiguyxmxqn.us-east-2.rds.amazonaws.com:3306/ADA";
	   static String             sqluser             = "coltonADA";
	   static String             sqlpassword         = "adaConnSql";
	   static Connection         connection       = null;
	   
	   public static boolean Login(String username, String password) {
		   connection = null;
		      try {
		         connection = DriverManager.getConnection(url, sqluser, sqlpassword);
		      } catch (SQLException e) {
		         System.out.println("Connection Failed! Check output console");
		         e.printStackTrace();
		      }
		      if (connection == null) {
		         System.out.println("Failed to make connection!");
		         return false;
		      }
		      try {
					String loginSQL = "select username from Admins where username =? and password =sha1(?)";
					PreparedStatement preparedStatement = connection.prepareStatement(loginSQL);
					preparedStatement.setString(1, username);
					preparedStatement.setString(2, password);
					ResultSet rs = preparedStatement.executeQuery();
					if( rs.next()) {
						preparedStatement.close();
						connection.close();
						return true;
					}
					preparedStatement.close();
					connection.close();
		      } catch (SQLException e) {
		         e.printStackTrace();
		      }
		   return false;
	   }
	   
	   public static void main(String[] args) {
		   //Test functions
		   if(Login("testuser", "testpass")) {
			   System.out.println("Test user logged in");
		   }
		   else {
			   System.out.println("Test user failed to log in");
		   }
	   }
}
