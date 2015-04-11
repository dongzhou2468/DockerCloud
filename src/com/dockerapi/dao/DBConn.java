package com.dockerapi.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.annotation.Resource;
import javax.sql.DataSource;

import org.springframework.stereotype.Component;

@Component
public class DBConn {

	private DataSource dataSource;

	@Resource
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	public boolean loginAuth(String email, String password) {
		
		boolean authen = false;
		System.out.println("email=" + email + " password=" + password);
		try {
			Connection conn = dataSource.getConnection();
			ResultSet rs = conn.createStatement().executeQuery("select * from user where email='" + email + "'");
			while(rs.next()){
				authen = (password.equals(rs.getString("password")));
				System.out.println(authen);
			}
			rs.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return authen;
		
	}
	
}
