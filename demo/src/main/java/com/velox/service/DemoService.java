package com.velox.service;

import org.json.JSONArray;
import org.json.JSONObject;

public interface DemoService {

	public String addUser(String administrator,String username, String email, String password, String birthday, String phone, String gender,
			String country, String vehicle);

	public JSONArray getUserList();

	JSONObject getUserDetails(int id);

	public String updateUser(String srno,String administrator,String username, String email, String password, String birthday, String phone,
			String gender, String country, String vehicle);

	public String deleteUser(String srno);

	public String[] login(String username, String password);
	
	public JSONArray getChartDetails();
	
}
