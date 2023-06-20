package com.DAO;

import com.entity.User;

public interface userDAO {
	
	public boolean userRegister(User us);//rahul
	
	
	
	public User login(String email,String password);//shiba
	
	public boolean checkUser(String email);
	
	public boolean checkPass(int id, String ps);
	
	public boolean updateProfile(User us);
	
		

}
