package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;
import com.entity.MedsDtls;
import com.mysql.cj.protocol.Resultset;

public class CartDAOImpl implements CartDAO {

	private Connection conn;

	public CartDAOImpl(Connection conn) {// parameterized constructor
		this.conn = conn;
	}

	@Override
	public boolean addCart(Cart c) {
		boolean f = false;
		try {

			String sql = "insert into cart(mid,uid,medsname,expdate,price) values(?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, c.getMid());
			ps.setInt(2, c.getUid());
			ps.setString(3, c.getMedsname());
			ps.setString(4, c.getExpdate());
			ps.setString(5, c.getPrice());
		

			int i = ps.executeUpdate();

			if (i == 1) {

				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<Cart> getMedsByUser(int userId) {
		List<Cart> list=new ArrayList<Cart>();
		Cart c = null;
	
		try {
			String sql = "select * from cart where uid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userId);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				
				c=new Cart();
				c.setCid(rs.getInt(1));
				c.setMid(rs.getInt(2));
				c.setUid(rs.getInt(3));
				c.setMedsname(rs.getString(4));
				c.setExpdate(rs.getString(5));
				c.setPrice(rs.getString(6));
				
			
				
				list.add(c);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	@Override
	public boolean deleteMeds(int mid,int uid) {
		boolean f=false;
		try {
			String sql="delete from cart where mid=? and uid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, mid);
			ps.setInt(2, uid);
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}

}
