package com.DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

	private static Connection connection= null;
	
	public static Connection getConnection() {
		
		try {
	       final String jdbcDriver = "com.mysql.cj.jdbc.Driver";
	      final  String serverUrl = "jdbc:mysql://localhost:3306/javaenote";
            final String user="root";
           final String pwd="root";
			Class.forName(jdbcDriver);
			
			connection=  DriverManager.getConnection(serverUrl, user, pwd);
//			System.out.println("loaded");
		} catch (Exception e) {
			System.err.println(e.getMessage());
		}
		
		return connection;
	}
	
}
