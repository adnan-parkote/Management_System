package com.velox.dao;

import java.util.List;

import com.velox.model.User;

public interface DemoDao {

	String addUser(User user);

	List<User> getUserList();

	User findUser(int id);

	String updateUser(User user);

	String updateUserSQL(String srno, String administrator,String username, String email, String password, String birthday, String phone,
			String gender, String country, String vehicle);

	String deleteUser(User user);

	String[] login(String username, String password);
	
	List<Object[]> getChartDetails();
}
