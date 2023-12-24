package com.velox.service;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.velox.dao.DemoDao;
import com.velox.model.User;

@Service
public class DemoServiceImpl implements DemoService {

	@Autowired
	DemoDao demodao;

	@Override
	public String addUser(String administrator,String username, String email, String password, String birthday, String phone, String gender,
			String country, String vehicle) {

		User user = new User();
		user.setUserrole(administrator);
		user.setUsername(username);
		user.setEmail(email);
		user.setPassword(password);
		user.setBirthday(birthday);
		user.setTelephone(phone);
		user.setGender(gender);
		user.setCountry(country);
		user.setVehicle(vehicle);

		return demodao.addUser(user);
	}

	@Override
	public JSONArray getUserList() {
		JSONArray result = new JSONArray();
		try {
			List<User> users = demodao.getUserList();
			for (User user : users) {
				JSONArray userArr = new JSONArray();
				userArr.put(user.getUserrole());
				userArr.put(user.getUsername());
				userArr.put(user.getEmail());
				userArr.put(user.getBirthday());
				userArr.put(user.getTelephone());
				userArr.put(user.getCountry());
				userArr.put(user.getGender());
		     	userArr.put(user.getVehicle());
		     	userArr.put("<button class='btn btn-primary' data-toggle='modal' data-target='#userEdit' onclick='editUser("+
		     			user.getUser_id() +")'>Edit</button>");
		     	userArr.put("<button class='btn btn-danger' onclick='deleteUser("+
		     			user.getUser_id()+")'>Delete</button>");
				result.put(userArr);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public JSONObject getUserDetails(int id) {
		JSONObject result = new JSONObject();

		try {
			User user = demodao.findUser(id);
			result.put("administrator", user.getUserrole());
			result.put("username", user.getUsername());
			result.put("email", user.getEmail());
			result.put("password", user.getPassword());
			result.put("birthday", user.getBirthday());
			result.put("phone", user.getTelephone());
			result.put("gender", user.getGender());
			result.put("country", user.getCountry());
			result.put("vehicle", user.getVehicle());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	@Override
	public String updateUser(String srno, String administrator,String username, String email, String password, String birthday, String phone,
			String gender, String country, String vehicle) {

//		User user = demodao.findUser(Integer.parseInt(srno));
//		user.setUsername(username);
//		user.setEmail(email);
//		user.setPassword(password);
//		user.setBirthday(birthday);
//		user.setTelephone(phone);
//		user.setGender(gender);
//		user.setCountry(country);
//		user.setVehicle(vehicle);
//		demodao.updateUset(user);

		return demodao.updateUserSQL(srno,administrator, username, email, password, birthday, phone, gender, country, vehicle);
	}

	@Override
	public String deleteUser(String srno) {

		User user = demodao.findUser(Integer.parseInt(srno));

		return demodao.deleteUser(user);
	}

	@Override
	public String[] login(String username, String password) {

		String[] status = null;
		try {
			status = demodao.login(username, password);

		} catch (Exception e) {
			e.printStackTrace();
		}
	//	System.out.println(status);
		return status;
	}

	@Override
	public JSONArray getChartDetails() {
		JSONArray result = new JSONArray();
		List<Object[]> userList = demodao.getChartDetails();
		 for(Object[] array : userList) {
	    		JSONObject userarray = new JSONObject();
	    		userarray.put("name", array[0]);
	    		userarray.put("y", array[1]);
	    		result.put(userarray);
		}
		return result;
	}
}
