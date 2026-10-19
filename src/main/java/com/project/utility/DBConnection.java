package com.project.utility;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	Connection con=null;
	public Connection getConnection(){
		try {
		Class.forName("com.mysql.cj.jdbc.Driver");
        String username = System.getenv("DB_USERNAME");
        String password = System.getenv("DB_PASSWORD");
		 con=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/hospital_db",username,password);
		}catch(Exception e) {
			System.out.println(e);
		}
		return con;
	}
}