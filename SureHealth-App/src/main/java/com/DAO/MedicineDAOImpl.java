package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.MedsDtls;

public class MedicineDAOImpl implements MedicineDAO {

	private Connection conn;

	public MedicineDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	
// add and medicines list storing in the database done by rahul
	@Override
	public boolean addMedicines(MedsDtls m) {// add medicines
		boolean f = false;
		try {

			String sql = "insert into meds_dtls(medsname,manufacturedby,date,category,units,email,price) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, m.getMedsname());// setting the values of the placeholders
			ps.setString(2, m.getManufacturedby());
			ps.setString(3, m.getDate());
			ps.setString(4, m.getCategory());
			ps.setString(5, m.getUnits());
			ps.setString(6, m.getEmail());
			ps.setString(7, m.getPrice());

			ps.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}

	@Override
	public List<MedsDtls> getAllMeds() {

		List<MedsDtls> list = new ArrayList<MedsDtls>();// declaring an empty list
		MedsDtls m = null;
		try {

			String sql = "select * from meds_dtls";
			PreparedStatement ps = conn.prepareStatement(sql);// prepare the sql query

			ResultSet rs = ps.executeQuery();// execute the query and store the results
			while (rs.next()) {

				m = new MedsDtls();
				m.setMedsid(rs.getInt(1));
				m.setMedsname(rs.getString(2));
				m.setManufacturedby(rs.getString(3));
				m.setDate(rs.getString(4));
				m.setCategory(rs.getString(5));
				m.setUnits(rs.getString(6));
				m.setEmail(rs.getString(7));
				m.setPrice(rs.getString(8));

				list.add(m);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	// add and medicines list storing in the database done by rahul

	@Override
	public List<MedsDtls> viewMeds() {
		List<MedsDtls> list = new ArrayList<>();

		MedsDtls m = null;

		try {
			String sql = "select * from meds_dtls where email=?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "doctor");
			ResultSet rs = ps.executeQuery();

			int i = 1;
			while (rs.next() && i <= 5) {
				m = new MedsDtls();
				m.setMedsid(rs.getInt(1));
				m.setMedsname(rs.getString(2));
				m.setManufacturedby(rs.getString(3));
				m.setDate(rs.getString(4));
				m.setCategory(rs.getString(5));
				m.setUnits(rs.getString(6));
				m.setEmail(rs.getString(7));
				m.setPrice(rs.getString(8));
				list.add(m);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}
	
	@Override
	public List<MedsDtls> viewAllMeds() {

		List<MedsDtls> list = new ArrayList<>();

		MedsDtls m = null;

		try {
			String sql = "select * from meds_dtls where email=?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "doctor");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				m = new MedsDtls();
				m.setMedsid(rs.getInt(1));
				m.setMedsname(rs.getString(2));
				m.setManufacturedby(rs.getString(3));
				m.setDate(rs.getString(4));
				m.setCategory(rs.getString(5));
				m.setUnits(rs.getString(6));
				m.setEmail(rs.getString(7));
				m.setPrice(rs.getString(8));
				list.add(m);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}



	@Override
	public MedsDtls getMedsById(int id) {

		MedsDtls m = null;
		try {
			String sql = "select * from meds_dtls where medsid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {// checking the row if it is available or not
				m = new MedsDtls();
				m.setMedsid(rs.getInt(1));
				m.setMedsname(rs.getString(2));
				m.setManufacturedby(rs.getString(3));
				m.setDate(rs.getString(4));
				m.setCategory(rs.getString(5));
				m.setUnits(rs.getString(6));
				m.setEmail(rs.getString(7));
				m.setPrice(rs.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return m;
	}

	//update and delete module done by sarfaraz
	@Override
	public boolean updateEditMeds(MedsDtls m) {// update

		boolean f = false;
		try {
			String sql = "update meds_dtls set medsname=?,manufacturedby=?,date=?,category=?,units=?,price=? where medsid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, m.getMedsname());
			ps.setString(2, m.getManufacturedby());
			ps.setString(3, m.getDate());
			ps.setString(4, m.getCategory());
			ps.setString(5, m.getUnits());
			ps.setString(6, m.getPrice());
			ps.setInt(7, m.getMedsid());
			
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
	public boolean deleteMeds(int id) {//delete
		boolean f = false;
		try {
			String sql = "delete from meds_dtls where medsid=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			int i = ps.executeUpdate();

			if (i == 1)
				f = true;

		} catch (Exception e) {

			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<MedsDtls> getMedsBySearch(String ch) {
		
		List<MedsDtls> list = new ArrayList<>();

		MedsDtls m = null;

		try {
			String sql = "select * from meds_dtls where medsname like ? or category like ?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
		
			
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				m = new MedsDtls();
				m.setMedsid(rs.getInt(1));
				m.setMedsname(rs.getString(2));
				m.setManufacturedby(rs.getString(3));
				m.setDate(rs.getString(4));
				m.setCategory(rs.getString(5));
				m.setUnits(rs.getString(6));
				m.setEmail(rs.getString(7));
				m.setPrice(rs.getString(8));
				list.add(m);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
		
	}
}	


