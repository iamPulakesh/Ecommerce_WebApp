package com.entity;

public class medsOrder {
	
	private int id;
	private String order_id;
	private String name;
	private String email;
	private String phone;
	private String fulladdress;
	private String medsname;
	private String Price;
	private String pay;
	public medsOrder() {
		super();
		
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getFulladdress() {
		return fulladdress;
	}
	public void setFulladdress(String fulladdress) {
		this.fulladdress = fulladdress;
	}
	public String getMedsname() {
		return medsname;
	}
	public void setMedsname(String medsname) {
		this.medsname = medsname;
	}
	public String getPrice() {
		return Price;
	}
	public void setPrice(String price) {
		Price = price;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	@Override
	public String toString() {
		return "medsOrder [id=" + id + ", order_id=" + order_id + ", name=" + name + ", email=" + email + ", phone="
				+ phone + ", fulladdress=" + fulladdress + ", medsname=" + medsname + ", Price=" + Price + ", pay="
				+ pay + "]";
	}
	
	
	
	

}
