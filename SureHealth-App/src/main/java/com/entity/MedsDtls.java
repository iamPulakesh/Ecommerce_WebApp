package com.entity;

public class MedsDtls {

	private int medsid;
	private String medsname;
	private String manufacturedby;
	private String date;
	private String category;
	private String units;
	private String email;
	private String price;

	public MedsDtls() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MedsDtls(String medsname, String manufacturedby, String date, String category, String units, String email,
			String price) {
		super();
		this.medsname = medsname;
		this.manufacturedby = manufacturedby;
		this.date = date;
		this.category = category;
		this.units = units;
		this.email = email;
		this.price = price;

	}

	public int getMedsid() {
		return medsid;
	}

	public void setMedsid(int medsid) {
		this.medsid = medsid;
	}

	public String getMedsname() {
		return medsname;
	}

	public void setMedsname(String medsname) {
		this.medsname = medsname;
	}

	public String getManufacturedby() {
		return manufacturedby;
	}

	public void setManufacturedby(String manufacturedby) {
		this.manufacturedby = manufacturedby;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;

	}

	public String getUnits() {
		return units;
	}

	public void setUnits(String units) {
		this.units = units;
	}

	public String getEmail() {

		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPrice() {

		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "MedsDtls [medsid=" + medsid + ", medsname=" + medsname + ", manufacturedby=" + manufacturedby
				+ ", date=" + date + ", category=" + category + " units=" + units + " email=" + email + "price=" + price +"]";
	}

}
