package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;
import com.mysql.cj.protocol.Resultset;
import com.mysql.cj.xdevapi.Result;

public class userDAOimpl implements userDAO {

	public User login(String email, String password) {

		User us = null;
		try {
			String sql = "select * from user where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(sql);// object we can execute multiple values with different
																// parameters
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				// iterating through the rs
				us = new User(); //for each row a new user object is created 
				us.setId(rs.getInt(1));
				us.setName(rs.getString(2));
				us.setEmail(rs.getString(3));
				us.setPhoneno(rs.getString(4));
				us.setPassword(rs.getString(5));
				us.setAddress(rs.getString(6));
				us.setCity(rs.getString(7));
				us.setState(rs.getString(8));
				us.setPincode(rs.getString(9));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return us;
	}

	private Connection conn;

	public userDAOimpl(Connection conn) {
		super();
		this.conn = conn;
	}
	
	
	
	
	
	

	@Override
	public boolean userRegister(User us) {
		boolean f = false; 
		
		try {
			String sql = "insert into user(name,email,phoneno,password) values(?,?,?,?)"; //inserting data into table
			PreparedStatement ps = conn.prepareStatement(sql);                                                             
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhoneno());
			ps.setString(4, us.getPassword());

			int i = ps.executeUpdate();//
			
			
			if (i == 1) {
				f = true;// insert one row on successful insertion
			}

		} catch (Exception e) {
			e.getStackTrace();
		}
		return f;
	}

	
	
	
	
	
	
	
	@Override
	public boolean checkUser(String email) {
		boolean f = true;
		try {
			String sql = "select * from user where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				f = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean checkPass(int id, String ps) {
		boolean f = false;

		try {
			String sql = "select * from user where id=? and password=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setInt(1, id);
			pst.setString(2, ps);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {
				f = true;

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean updateProfile(User us) {
		boolean f = false;
		try {
			String sql = "update user set name=?,email=?,phoneno=? where id=?";// inserting data into table
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhoneno());
			ps.setInt(4, us.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;// insert one row on successful insertion
			}

		} catch (Exception e) {
			e.getStackTrace();
		}
		return f;///////////////////////////////////////////////////////////
	}
}
