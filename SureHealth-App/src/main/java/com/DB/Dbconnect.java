package com.DB;
import java.sql.Connection;
import java.sql.DriverManager;
public class Dbconnect {

	private static Connection conn; //declaring an object to store the DB connection
	public static Connection getConn() //static method getConn() to establish the DB connection
	
	{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");// loading the mysql jdbc driver
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/surehealth-app","root","password");
			
			} catch (Exception e) {
			e.getStackTrace();
		}
		return conn;
	}
	
}
