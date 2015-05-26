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

	public String loginAuth(String email, String password) {

		boolean authen = false;
		String username = "";
		System.out.println("email=" + email + " password=" + password);
		try {
			Connection conn = dataSource.getConnection();
			ResultSet rs = conn.createStatement().executeQuery(
					"select * from user where email='" + email + "'");
			while (rs.next()) {
				authen = (password.equals(rs.getString("password")));
				System.out.println(authen);
				if (authen == false) {
					break;
				}
				username = rs.getString("username");
			}
			rs.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return username;
	}

	public String imageInfo(String name, String item) {

		String retrieve = "";
		System.out.println("name=" + name + " to retrieve=" + item);
		try {
			Connection conn = dataSource.getConnection();
			ResultSet rs = conn.createStatement().executeQuery(
					"select " + item + " from app where name='" + name + "'");
			while (rs.next()) {
				retrieve = rs.getString(item);
				System.out.println(retrieve);
			}
			rs.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return retrieve;
	}
}
