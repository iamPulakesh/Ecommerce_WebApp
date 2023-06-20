package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import com.entity.medsOrder;

public class medsOrderImpl implements medsOrderDAO{
	
	private Connection conn;
	

	public medsOrderImpl(Connection conn) {
		super();
		this.conn = conn;
	}


	


	@Override
	public boolean saveOrder(List<medsOrder> mlist) {
		boolean f=false;
		
		try {
			String sql="insert into meds_order(order_id,user_name,email,address,meds_name,price,payment) values(?,?,?,?,?,?,?)";
			
			conn.setAutoCommit(false);
			PreparedStatement ps=conn.prepareStatement(sql);
			
			for(medsOrder mo:mlist) {
				
				ps.setString(1, mo.getOrder_id());
				ps.setString(2, mo.getName());
				ps.setString(3, mo.getEmail());
				ps.setString(4, mo.getFulladdress());
				ps.setString(5, mo.getMedsname());
				ps.setString(6, mo.getPrice());
				ps.setString(7, mo.getPay());
				ps.addBatch();
			}
			
			int[] count=ps.executeBatch();
			conn.commit();
			f=true;
			conn.setAutoCommit(true);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	

}
